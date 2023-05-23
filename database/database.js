// Imports
import { Sequelize } from "sequelize";
import dotenv from "dotenv";

// Configs
dotenv.config({ path: './.env' });

const sequelize = new Sequelize(
  process.env.DB_DATABASE,
  process.env.DB_USER,
  process.env.DB_PASSWORD,
  {
    host: process.env.DB_HOST,
    dialect: "mysql",
  }
);

// Créer la table si elle n'existe pas
sequelize.sync();

// Test la connection à la BDD
(async () => {
  try {
    await sequelize.authenticate();
    console.log("La connection à la BDD à bien été établie.");
  } catch (error) {
    console.error("Impossible de se connecter à la BDD:", error);
  }
})();

export default sequelize;