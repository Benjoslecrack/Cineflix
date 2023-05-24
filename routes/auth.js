// Initialisation de la Route
import express from "express";
const router = express.Router();

// Imports des fonctions
import { register, getRegister, getLogin, login } from "../controllers/auth.js";

/**
 * Route GET
 * Inscription
 */
router.get("/register", getRegister);

/**
 * Route POST
 * Inscription
 */
router.post("/register", register);

/**
 * Route GET
 * Connexion 
 */
router.get("/login", getLogin);

router.post("/login", login)

export default router;