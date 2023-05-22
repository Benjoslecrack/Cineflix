/**
 * GET /
 * Page d'accueil
 */
export const getHomePage = async (req, res) => {
    res.render('index', { title: "Bienvenue sur CinéFlix !"})
}