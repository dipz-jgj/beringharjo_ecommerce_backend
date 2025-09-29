const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const getAllProduct = async (req, res) => {
  const product = await prisma.products.findMany();
  res.json(product);
//   res.json({
//     results: product,
//   });
}

const getProduct = async (req, res) => {
  const { id } = req.params;
  const product = await prisma.products.findUnique({ where: { id } });
  if (!product) return res.status(404).json({ message: "product not found" });
  res.json(product);
}

const createProduct = async (req, res) => {
  const { name, description, price, product_stock, product_image } = req.body;
  try {
    const product = await prisma.products.create({
      data: { name, description, price, product_stock, product_image },
    });
    res.json(product);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
}

const updateProduct = async (req, res) => {
  const { id } = req.params;
  const { name, description, price, product_stock, product_image } = req.body;
  try {
    const product = await prisma.products.update({
      where: { id },
      data: { name, description, price, product_stock, product_image },
    });
    res.json(product);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
}

const deleteProduct = async (req, res) => {
  const { id } = req.params;
  try {
    await prisma.products.delete({ where: { id } });
    res.json({ message: "product deleted" });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
}

module.exports = { getAllProduct, getProduct, createProduct, updateProduct, deleteProduct }
