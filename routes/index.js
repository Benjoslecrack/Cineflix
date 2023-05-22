// Initialisation de la Route
import express from "express";
const router = express.Router();

// Imports controller
import { getHomePage } from "../controllers/index.js";

/////////////////////////////////// ROUTES

// Route GET pour la page d'accueil
router.get("/", getHomePage);

export default router;
