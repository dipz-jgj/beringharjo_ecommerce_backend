-- CreateTable
CREATE TABLE "blog"."Products" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "price" DECIMAL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "Products_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "blog"."Transaction" (
    "id" TEXT NOT NULL,
    "transactionNo" TEXT,
    "qtyAll" INTEGER,
    "subTotal" DECIMAL,
    "transactionDate" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "userId" TEXT NOT NULL,

    CONSTRAINT "Transaction_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "blog"."Transaction_Details" (
    "id" TEXT NOT NULL,
    "qty" INTEGER,
    "total" DECIMAL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "productId" TEXT NOT NULL,
    "transactionId" TEXT NOT NULL,

    CONSTRAINT "Transaction_Details_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "blog"."Transaction" ADD CONSTRAINT "Transaction_userId_fkey" FOREIGN KEY ("userId") REFERENCES "blog"."User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "blog"."Transaction_Details" ADD CONSTRAINT "Transaction_Details_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES "blog"."Transaction"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "blog"."Transaction_Details" ADD CONSTRAINT "Transaction_Details_productId_fkey" FOREIGN KEY ("productId") REFERENCES "blog"."Products"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
