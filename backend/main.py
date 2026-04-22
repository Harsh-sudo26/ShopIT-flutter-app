from fastapi import FastAPI, HTTPException
from pydantic import BaseModel
from typing import List

app = FastAPI()

@app.get("/")
def home():
    return {"message": "API is running 🚀"}

class Product(BaseModel):
    id: int
    name: str
    price: float
    description: str
    image: str

products = [
  {
    "id": 1,
    "name": "iPhone 14",
    "price": 999,
    "description": "The Apple iPhone 14 combines sleek design with powerful performance, making it a reliable choice for everyday use.",
    "image": "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/MGFH4?wid=1144&hei=1144&fmt=jpeg&qlt=90"
  },
  {
    "id": 2,
    "name": "Shoes",
    "price": 1999,
    "description": "Lightweight and breathable shoes designed for comfort and performance.",
    "image": "https://shop.teamsg.in/cdn/shop/files/1_ee84a279-8cc7-463e-b282-a22b398f553f.png?v=1720251201"
  },
  {
    "id": 3,
    "name": "Watch",
    "price": 1939,
    "description": "Smartwatch with fitness tracking and notifications.",
    "image": "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/watch-card-40-se-202603_FMT_WHH?wid=508&hei=472&fmt=p-jpg&qlt=95"
  },
  {
    "id": 4,
    "name": "Earbuds",
    "price": 19900,
    "description": "Wireless earbuds with noise cancellation and premium sound.",
    "image": "https://www.flashify.in/cdn/shop/products/61sRKTAfrhL.jpg"
  },
  {
    "id": 5,
    "name": "Cover",
    "price": 19299,
    "description": "Durable silicone phone cover for protection.",
    "image": "https://tiimg.tistatic.com/fp/1/007/827/comfortable-light-in-weight-durable-soft-silicone-plain-simple-mobile-cover--078.jpg"
  },
  {
    "id": 6,
    "name": "Charger",
    "price": 1999,
    "description": "20W fast charging adapter with safety features.",
    "image": "https://m.media-amazon.com/images/I/51VM2jCx6kL._AC_UF1000,1000_QL80_.jpg"
  },
  {
    "id": 7,
    "name": "Laptop",
    "price": 65999,
    "description": "High-performance laptop for work and gaming.",
    "image": "https://m.media-amazon.com/images/I/71jG+e7roXL._SL1500_.jpg"
  },
  {
    "id": 8,
    "name": "Backpack",
    "price": 1499,
    "description": "Durable backpack with multiple compartments.",
    "image": "https://m.media-amazon.com/images/I/81KEhY6iYFL._UL1500_.jpg"
  },
  {
    "id": 9,
    "name": "Gaming Mouse",
    "price": 1299,
    "description": "High-precision gaming mouse with RGB lighting.",
    "image": "https://m.media-amazon.com/images/I/61mpMH5TzkL._SL1500_.jpg"
  },
  {
    "id": 10,
    "name": "Keyboard",
    "price": 2499,
    "description": "Mechanical keyboard with tactile feedback.",
    "image": "https://m.media-amazon.com/images/I/71Wj2G+8QyL._SL1500_.jpg"
  },
  {
    "id": 11,
    "name": "Power Bank",
    "price": 1799,
    "description": "Portable power bank with fast charging support.",
    "image": "https://m.media-amazon.com/images/I/71lVwl3q-kL._SL1500_.jpg"
  },
  {
    "id": 12,
    "name": "Bluetooth Speaker",
    "price": 2999,
    "description": "Portable speaker with deep bass and long battery life.",
    "image": "https://m.media-amazon.com/images/I/71FQkX6fQRL._SL1500_.jpg"
  },
  {
    "id": 13,
    "name": "Smart TV",
    "price": 39999,
    "description": "4K smart TV with streaming apps and voice control.",
    "image": "https://m.media-amazon.com/images/I/81o7pXzC-XL._SL1500_.jpg"
  },
  {
    "id": 14,
    "name": "Headphones",
    "price": 3499,
    "description": "Over-ear headphones with immersive sound.",
    "image": "https://m.media-amazon.com/images/I/71rnjN4a5JL._SL1500_.jpg"
  },
  {
    "id": 15,
    "name": "Tablet",
    "price": 25999,
    "description": "Lightweight tablet for entertainment and productivity.",
    "image": "https://m.media-amazon.com/images/I/71QXzV6rYpL._SL1500_.jpg"
  },
  {
    "id": 16,
    "name": "Fitness Band",
    "price": 1999,
    "description": "Fitness band with health tracking features.",
    "image": "https://m.media-amazon.com/images/I/61t2yy9uX7L._SL1500_.jpg"
  }
]

@app.get("/products", response_model=List[Product])
def get_products():
    return products

@app.get("/products/{product_id}")
def get_product(product_id: int):
    for product in products:
        if product["id"] == product_id:
            return product
    raise HTTPException(status_code=404, detail="Product not found")

@app.post("/products")
def add_product(product: Product):
    products.append(product.dict())
    return {"message": "Product added successfully"}