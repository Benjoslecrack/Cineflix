// Initialisation de la Route
import express from "express";
const router = express.Router();

/**
 * Route POST
 * Inscription
 */
router.post("/register", (req, res) => {
    console.log("Coucou");
    res.redirect('/');
})

export default router;