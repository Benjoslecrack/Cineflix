// Imports
import express from "express";
import cors from "cors";
import cookieParser from "cookie-parser";
import bodyParser from "body-parser";
import dotenv from "dotenv";
import expressLayouts from "express-ejs-layouts";

// Importation des Routes
import indexRouter from "./routes/index.js";

// Configs
dotenv.config();
const corsOptions = {
  origin: [process.env.CORS_ORIGIN1, process.env.CORS_ORIGIN2],
  optionsSuccessStatus: 200,
  credentials: true,
  methods: "GET,HEAD,PUT,PATCH,POST,DELETE",
};

const PORT = process.env.PORT || 3000;

// Initialisation de l'app
const app = express();
app.use(cors(corsOptions));
app.use(cookieParser());
app.use(express.urlencoded({ extended: true }));
app.use(express.static("public"));
app.use(expressLayouts);
app.use(bodyParser.json());

// Moteur de Rendu
app.set("layout", "./layouts/main");
app.set("view engine", "ejs");

// Port d'écoute
app.listen(PORT, () =>
  console.log(`Connected to Backend on port ${PORT}`)
);

// Redirection de public sur uploads
app.use(express.static("public"));
app.use("/uploads", express.static("uploads"));

// Routes
app.use("/", indexRouter);

// Gestion des erreurs global
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).send(`${err.message}`);
});
