const { Router } = require("express");
const transactionController = require("../controller/transactionController.js");
const { authenticateToken } = require("../middleware/authMiddleware.js");

const router = Router();

router.get("/", authenticateToken, transactionController.getAllTransaction);
router.get("/:id", authenticateToken, transactionController.getTransaction);
router.post("/", authenticateToken, transactionController.createTransaction);
router.put("/:id", authenticateToken, transactionController.updateTransaction);
router.delete("/:id", authenticateToken, transactionController.deleteTransaction);

module.exports = router;