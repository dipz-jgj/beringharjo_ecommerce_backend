const { Router } = require("express");
const productController = require("../controller/productController.js");
const { authenticateToken } = require("../middleware/authMiddleware.js");

const router = Router();

router.get("/", productController.getAllProduct);
router.get("/:id", productController.getProduct);
router.post("/", authenticateToken, productController.createProduct);
router.put("/:id", authenticateToken, productController.updateProduct);
router.delete("/:id", authenticateToken, productController.deleteProduct);

module.exports = router;