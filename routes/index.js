// Initialisation de la Route
import express from "express";
const router = express.Router();

// Imports controller
import { getHomePage } from "../controllers/index.js";

// Imports Routes
import authRoute from "./auth.js";

/////////////////////////////////// ROUTES

/**
 * Route GET
 * Page d'accueil
 */
router.get("/", getHomePage);

// Utilisation des routes
router.use("/auth", authRoute);


// Export
export default router;