const { PrismaClient } = require("@prisma/client");

const prisma = new PrismaClient();

const getAllTransaction = async (req, res) => {
  const transaction = await prisma.transaction.findMany();
  res.json(transaction);
}

const getTransaction = async (req, res) => {
  const { id } = req.params;
  const transaction = await prisma.transactions.findUnique({ where: { id } });
  if (!transaction) return res.status(404).json({ message: "transaction not found" });
  res.json(transaction);
}

const createTransaction = async (req, res) => {
  const { transactionNo, qtyAll, subTotal, userId } = req.body;
  try {
    const transaction = await prisma.transaction.create({
      data: { transactionNo, qtyAll, subTotal, userId },
    });
    res.json(transaction);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
}

const updateTransaction = async (req, res) => {
  const { id } = req.params;
  const {transactionNo, qtyAll, subTotal, userId } = req.body;
  try {
    const transaction = await prisma.transaction.update({
      where: { id },
      data: { transactionNo, qtyAll, subTotal, userId },
    });
    res.json(transaction);
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
}

const deleteTransaction = async (req, res) => {
  const { id } = req.params;
  try {
    await prisma.transaction.delete({ where: { id } });
    res.json({ message: "Transaction deleted" });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
}

module.exports = { getAllTransaction, getTransaction, createTransaction, updateTransaction, deleteTransaction }