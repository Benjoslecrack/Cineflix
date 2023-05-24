// Imports
import passport from "passport";
import passportJwt from "passport-jwt";
import dotenv from "dotenv";
import User from "../models/user.js";

// Configs
dotenv.config({ path: "./.env" });

// Const
const ExtractJwt = passportJwt.ExtractJwt;
const StrategyJwt = passportJwt.Strategy;

// Middleware
/**
 * Check si le token est le bon
 */
passport.use(
  new StrategyJwt(
    {
      jwtFromRequest: ExtractJwt.fromAuthHeaderAsBearerToken(),
      secretOrKey: process.env.SECRET_KEY,
    },
    function (jwtPayload, done) {
      return User.findOne({ where: { id: jwtPayload.id } })
        .then((user) => {
          return done(null, user);
        })
        .catch((err) => {
          return done(err);
        });
    }
  )
);

// passport.serializeUser(function (user, done) {
//   return done(null, user.id);
// });
// passport.deserializeUser(function (id, done) {
//   User.findById(id, function (err, user) {
//     return done(err, user);
//   });
// });
