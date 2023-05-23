// Initialisation de la Route
import express from "express";
const router = express.Router();

// Imports des fonctions
import { register } from "../controllers/auth.js";

/**
 * Route POST
 * Inscription
 */
router.post("/register", register);

export default router;