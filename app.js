// Imports
import express from "express";
import cors from "cors";
import cookieParser from "cookie-parser";
import bodyParser from "body-parser";
import dotenv from "dotenv";
import expressLayouts from "express-ejs-layouts";
import morgan from "morgan";
// import helmet from "helmet";
import session from "express-session";
import passport from "passport";
import "./auth/passport.js";

// Configs
dotenv.config({ path: './.env' });
const corsOptions = {
  origin: [process.env.CORS_ORIGIN1, process.env.CORS_ORIGIN2],
  optionsSuccessStatus: 200,
  credentials: true,
  methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
};
const PORT = process.env.PORT || 3000;

// Importation des Routes
import indexRouter from "./routes/index.js";

// Initialisation de l'app
const app = express();
app.use(cors(corsOptions));
app.use(cookieParser());
app.use(express.static("public"));
app.use(expressLayouts);
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(morgan("dev"));
app.use(session({
  secret: process.env.SECRET_KEY,
  resave: false,
  saveUninitialized: false,
  cookie : {
    maxAge : 1000 * 60 * 60 * 24 * 7,
    secure : false
  }
}))
// test
app.use(passport.initialize());
app.use(passport.session());

app.use(async(req, res, next) => {
  console.log("SESSION : ", req.session);
  next();
})

// app.use(helmet());

// Moteur de Rendu
app.set("layout", "./layouts/main");
app.set("view engine", "ejs");

// Port d'écoute
app.listen(PORT, () =>
  console.log(`Connecté: http://localhost:${PORT}`)
);

// Redirection de public sur uploads
app.use("/uploads", express.static("uploads"));

// Routes
app.use("/", indexRouter);

// Gestion des erreurs global
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send(`${err.message}`);
});