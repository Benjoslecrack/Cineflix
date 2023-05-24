// Initialisation de la Route
import express from "express";
import passport from "passport";
const router = express.Router();

router.get("/", passport.authenticate("jwt", { session: false }),(req, res) => {
    res.json({message: "Cette route est sécu"});
})

export default router;