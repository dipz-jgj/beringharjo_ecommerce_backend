const { Router } = require("express");
const userController = require("../controller/userController.js");
const { authenticateToken } = require("../middleware/authMiddleware.js");

const router = Router();

router.post("/register", userController.register);
router.post("/login", userController.login);
router.post("/logout", authenticateToken, userController.logout);

router.get("/", authenticateToken, userController.getAllUsers);
router.get("/:id", authenticateToken, userController.getUser);
router.put("/:id", authenticateToken, userController.updateUser);
router.delete("/:id", authenticateToken, userController.deleteUser);

module.exports = router;