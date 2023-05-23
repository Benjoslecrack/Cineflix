// Imports
import express from "express";
import cors from "cors";
import cookieParser from "cookie-parser";
import bodyParser from "body-parser";
import dotenv from "dotenv";
import expressLayouts from "express-ejs-layouts";
import mysql from "mysql2";
import morgan from "morgan";
// import helmet from "helmet";
import path from "path";

// Importation des Routes
import indexRouter from "./routes/index.js";

// Configs
dotenv.config({ path: './.env' });
const corsOptions = {
  origin: [process.env.CORS_ORIGIN1, process.env.CORS_ORIGIN2],
  optionsSuccessStatus: 200,
  credentials: true,
  methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
};
const connection = mysql.createConnection({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE
});

const PORT = process.env.PORT || 3000;

// Initialisation de l'app
const app = express();
app.use(cors(corsOptions));
app.use(cookieParser());
app.use(express.static("public"));
app.use(expressLayouts);
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(morgan("dev"));
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
connection.connect((error) => {
  if (error) {
    console.log(error)
  } else {
    console.log("La Base de données est connectée");
  }
})
