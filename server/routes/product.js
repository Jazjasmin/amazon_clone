const express = require("express");
const adminRouter = express.Router();
const productRouter = express.Router();
const auth = require("../middleware/auth");
const { Product } = require("../model/product");

productRouter.get("/api/products", auth, async (req, res) => {
  try {
    const products = await Product.find({ category: req.query.category });
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//create a get request to search products and get them

productRouter.get("/api/products/search/:name", auth, async (req, res) => {
  try {
    const products = await Product.find({
      name: { $regex: req.params.name, $options: "i" },
    });
    res.json(products);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

//create a post request route to rate the product

productRouter.post("/api/rate-product", auth, async (req, res) => {
  try {
    const { id, raring } = req.body;
    let product = await Product.findById(id);

    for (let i = 0; i < product.raring.length; i++) {
      if (product.raring[i].userId == req.body) {
        product.raring.splice(i, 1);
        break;
      }
    }

    const ratingSchema = {
      userId: req.user,
      raring,
    };
    product.raring.push(ratingSchema);
    product = await product.save();
    res.json(product);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

productRouter.get("/api/deal-of-day", auth, async (req, res) => {
  try {
    let products = await Product.find({});

    products = products.sort((a, b) => {
      let aSum = 0;
      let bSum = 0;

      for (let i = 0; i < a.rarings.length; i++) {
        aSum += a.ratings[i].raring;
      }

      for (let i = 0; i < b.rarings.length; i++) {
        bSum += b.ratings[i].raring;
      }
      return aSum < bSum ? 1 : -1;
    });
    res.json(products[0]);
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = productRouter;
