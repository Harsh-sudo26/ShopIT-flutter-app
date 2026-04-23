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

products =[
  {
    "id": 1,
    "name": "Apple iPhone 14",
    "price": 79999,
    "description": "The Apple iPhone 14 delivers a premium smartphone experience with its sleek design and powerful performance. It features a 6.1-inch Super Retina XDR display that produces vibrant colors, deep blacks, and exceptional clarity for an immersive viewing experience. Powered by the A15 Bionic chip, it ensures lightning-fast performance, smooth multitasking, and efficient power usage. The advanced dual-camera system captures stunning photos and cinematic videos, even in low-light conditions. With features like Face ID, iOS optimization, and long-lasting battery life, the iPhone 14 is designed for both productivity and entertainment.",
    "image": "https://m.media-amazon.com/images/I/61bK6PMOC3L._SL1500_.jpg"
  },
  {
    "id": 2,
    "name": "Nike Running Shoes",
    "price": 3999,
    "description": "These lightweight Nike running shoes are engineered for comfort, durability, and high performance. Designed with breathable mesh fabric, they allow proper airflow to keep your feet cool and dry during intense workouts or long walks. The cushioned sole provides excellent shock absorption, reducing strain on joints and enhancing comfort. With a flexible structure and durable outsole, they offer superior grip and stability on various surfaces. Perfect for running, gym workouts, or everyday casual wear.",
    "image": "https://m.media-amazon.com/images/I/71dEY4Neo3L._UL1500_.jpg"
  },
  {
    "id": 3,
    "name": "Smart Fitness Watch",
    "price": 2999,
    "description": "This modern smartwatch helps you stay connected and track your fitness goals effortlessly. It monitors steps, calories burned, heart rate, and sleep patterns with precision. With smart notifications, you can receive calls, messages, and app alerts directly on your wrist. The stylish and lightweight design makes it suitable for both casual and formal use. Its long battery life ensures uninterrupted usage, making it an ideal companion for your daily lifestyle and fitness tracking needs.",
    "image": "https://m.media-amazon.com/images/I/61y2VVWcGBL._SL1500_.jpg"
  },
  {
    "id": 4,
    "name": "Wireless Noise Cancelling Earbuds",
    "price": 4999,
    "description": "Experience superior sound quality with these wireless noise-cancelling earbuds. Equipped with advanced audio technology, they deliver deep bass, clear vocals, and balanced sound output. The active noise cancellation feature blocks external noise, allowing you to focus on music or calls. Designed for comfort, they fit securely in your ears and are perfect for long listening sessions. The compact charging case extends battery life, making them ideal for travel, workouts, and daily use.",
    "image": "https://m.media-amazon.com/images/I/61SUj2aKoEL._SL1500_.jpg"
  },
  {
    "id": 5,
    "name": "Silicone Phone Case",
    "price": 499,
    "description": "Protect your smartphone with this durable and stylish silicone phone case. The soft-touch material offers a comfortable grip while safeguarding your device from scratches, drops, and minor impacts. Its slim design ensures minimal bulk while maintaining the original look of your phone. Precise cutouts provide easy access to buttons, ports, and camera. A perfect combination of protection, functionality, and style for everyday use.",
    "image": "https://m.media-amazon.com/images/I/61uhVZC1UqL._SL1500_.jpg"
  },
  {
    "id": 6,
    "name": "20W Fast Charger Adapter",
    "price": 999,
    "description": "This 20W fast charging adapter ensures quick and efficient charging for your devices. Designed with advanced safety features, it protects against overheating, overcharging, and short circuits. Its compact and lightweight design makes it highly portable, perfect for travel or everyday use. Compatible with a wide range of smartphones and accessories, it delivers reliable and consistent performance.",
    "image": "https://m.media-amazon.com/images/I/51VM2jCx6kL._SL1500_.jpg"
  },
  {
    "id": 7,
    "name": "HP Laptop 15.6-inch",
    "price": 65999,
    "description": "This high-performance HP laptop is designed for productivity and entertainment. Powered by a fast processor and supported by ample RAM, it ensures smooth multitasking and quick application launches. The Full HD display delivers sharp visuals and vibrant colors, enhancing your experience whether you're working, streaming, or gaming. With a long-lasting battery and sleek design, it is perfect for students and professionals on the go.",
    "image": "https://m.media-amazon.com/images/I/71jG+e7roXL._SL1500_.jpg"
  },
  {
    "id": 8,
    "name": "Travel Backpack",
    "price": 1499,
    "description": "This versatile backpack is perfect for daily use, travel, or work. It features multiple spacious compartments, including a dedicated laptop section, to keep your belongings organized. The padded shoulder straps provide comfort during extended use, while the water-resistant material protects your items from unexpected weather conditions. Stylish and durable, it is ideal for students, professionals, and travelers.",
    "image": "https://m.media-amazon.com/images/I/81vpsIs58WL._UL1500_.jpg"
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