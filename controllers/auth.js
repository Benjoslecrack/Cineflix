// Imports
import User from "../models/user.js";
import jwt from "jsonwebtoken";
import bcrypt from "bcryptjs";
import passport from "passport";

/**
 * getRegister
 * MiddleWare qui retourne la page d'inscription
 * @param {*} req
 * @param {*} res
 */
export const getRegister = (req, res) => {
  res.render("register", { title: "Inscrivez-vous!" });
};

/**
 * register
 * MiddleWare qui enregistre l'utilisateur en BDD
 * @param {*} req
 * @param {*} res
 * @param {*} next
 * @returns
 */
export const register = async (req, res, next) => {
try{
      // Récupération des données
  const { username, email, password } = req.body;

  // Test si le user est existant
  const alreadyExistsUser = await User.findOne({ where: { email } }).catch(
    (err) => {
      console.log("Error: ", err);
    }
  );
  if (alreadyExistsUser) {
    return res.render("register", { message: "L'utilisateur existe déjà!" });
  }

  // Encrypte le mdp et creer l'utilisateur
  const salt = bcrypt.genSaltSync(10);
  const hashPassword = bcrypt.hashSync(req.body.password, salt);

  // Création du nouvel utilisateur
  const newUser = new User({ username, email, password: hashPassword });

  // Sauvegarde du nouvel utilisateur en BDD;
  const savedUser = await newUser.save().catch((err) => {
    console.log("Error: ", err);
    res.json({
      error: "L'utilisateur n'a pas pu être enregistré pour le moment.",
    });
  });

  if (savedUser) {
    res.render("index", { message: "Merci de vous être inscrit!" });
  }
} catch (err) {
    console.log(err);
}
};

/**
 * getLogin
 * MiddleWare qui retourne la page de connexion
 * @param {*} req
 * @param {*} res
 */
export const getLogin = (req, res) => {
  res.render("login", { title: "Connectez-vous!" });
};

export const login = async (req, res, next) => {
  // Récupération des données
  const { email, password } = req.body;

  // Cherche l'utilisateur
  const userWithEmail = await User.findOne({ where: { email } }).catch((err) => {
    console.log("Error: ", err);
  });
  if (!userWithEmail) {
    return res.render("login", {
      message: "L'Email ou le Mot de Passe ne correspondent pas!",
    });
  }

  // Compare les mot de passe
  const isPasswordCorrect = await bcrypt.compare(
    password,
    userWithEmail.password
  );

  if (!isPasswordCorrect) {
    return res.render("login", {
      message: "L'Email ou le Mot de Passe ne correspondent pas!",
    });
  }

  const jwtToken = jwt.sign({
    id: userWithEmail.id,
    email: userWithEmail.email,
  }, process.env.SECRET_KEY);

  res.render("index", { message: "Ravi de vous revoir!", token: jwtToken });
};
