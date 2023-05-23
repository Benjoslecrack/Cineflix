// Imports
import User from "../models/user.js";

/**
 * register
 * MiddleWare qui enregistre l'utilisateur en BDD
 * @param {*} req 
 * @param {*} res 
 * @param {*} next 
 * @returns 
 */
export const register = async (req, res, next) => {
    // Récupération des données
    const { username, email, password } = req.body;

    // Test si le user est existant
    const alreadyExistsUser = await User.findOne({ where: { email } }).catch((err) => {
        console.log("Error: ", err);
    });
    if(alreadyExistsUser) {
        return res.json({message: "L'utilisateur existe déjà!"});
    }

    // Création du nouvel utilisateur
    const newUser = new User({username, email, password});

    // Sauvegarde du nouvel utilisateur en BDD;
    const savedUser = await newUser.save().catch((err) => {
        console.log("Error: ", err);
        res.json({error: "L'utilisateur n'a pas pu être enregistré pour le moment."});
    });

    if(savedUser) {
        res.json({ message: "Merci de vous être inscrit!" });
    }
}

export const login = async (req, res) => {
    // Récupération des données
    const { email, password } = req.body;

    const userWithEmail = User.findOne({ where: email }).catch((err) => {
        console.log("Error: ", err)
    })
}