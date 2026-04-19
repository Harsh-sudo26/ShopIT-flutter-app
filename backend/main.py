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
        "description": "The Apple iPhone 14 combines sleek design with powerful performance, making it a reliable choice for everyday use. It features a stunning 6.1-inch Super Retina XDR display that delivers sharp visuals and vibrant colors. Powered by the A15 Bionic chip, it ensures smooth multitasking, fast app performance, and efficient battery life. Capture stunning photos and videos with its advanced dual-camera system, including improved low-light performance and cinematic video recording. The iPhone 14 also introduces enhanced safety features like Crash Detection and Emergency SOS via satellite, providing peace of mind wherever you go.",
        "image": "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/MGFH4?wid=1144&hei=1144&fmt=jpeg&qlt=90"
    },
    {
        "id": 2,
        "name": "Shoes",
        "price": 1999,
        "description": "These lightweight and breathable shoes are designed for maximum comfort and performance. Built with high-quality mesh fabric, they allow proper airflow to keep your feet cool during long runs or daily activities. The cushioned sole provides excellent shock absorption, reducing strain on your feet and joints. Whether you're running, walking, or hitting the gym, these shoes offer durability, flexibility, and style all in one.",
        "image": "https://shop.teamsg.in/cdn/shop/files/1_ee84a279-8cc7-463e-b282-a22b398f553f.png?v=1720251201"
    },
    {
        "id": 3,
        "name": "Watch",
        "price": 1939,
        "description": "This modern smartwatch is designed to keep you connected and healthy. It tracks your daily activities including steps, calories burned, and heart rate in real time. With smart notifications, you can receive calls, messages, and app alerts directly on your wrist. The sleek and stylish design makes it suitable for both casual and formal wear, while the long-lasting battery ensures uninterrupted performance throughout the day.",
        "image": "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/watch-card-40-se-202603_FMT_WHH?wid=508&hei=472&fmt=p-jpg&qlt=95&.v=dFQyNjEycitpbFBFNXA5RHpaQjc1a2YwVXZvYWdoa2NXQndKNFdmSlMzdWZaQno4VzdyOTRhQU93VEhhWjgvSHg4ZHpEbm5XWGdaM3BiNVRDaG55Uk9OM1JTVGtKUFFWc0NQZFFxTkdlYUJBU25Ob2N5dVQyQmxkN0IyWWVHdW0"
    },
    {
        "id": 4,
        "name": "Earbuds",
        "price": 19900,
        "description": "Experience premium sound quality with these wireless earbuds featuring advanced noise cancellation technology. Designed for comfort and long listening sessions, they fit securely in your ears while delivering deep bass and crystal-clear audio. The earbuds come with a long-lasting battery and a compact charging case, making them perfect for travel, workouts, and daily use. Seamless connectivity ensures a smooth listening experience across devices.",
        "image": "https://www.flashify.in/cdn/shop/products/61sRKTAfrhL.jpg?crop=center&height=1200&v=1733946410&width=1200"
    },
    {
        "id": 5,
        "name": "Cover",
        "price": 19299,
        "description": "Protect your smartphone with this durable silicone case designed for both safety and style. The soft-touch material provides a comfortable grip while safeguarding your device from scratches, drops, and everyday wear. Its precise cutouts ensure easy access to all ports and buttons. Lightweight yet sturdy, this case adds minimal bulk while offering maximum protection.",
        "image": "https://tiimg.tistatic.com/fp/1/007/827/comfortable-light-in-weight-durable-soft-silicone-plain-simple-mobile-cover--078.jpg"
    },
    {
        "id": 6,
        "name": "Charger",
        "price": 1999,
        "description": "This 20W fast charging adapter is designed to power up your devices quickly and safely. With advanced charging technology, it ensures efficient power delivery while protecting against overheating and overcharging. Compact and lightweight, it is easy to carry and perfect for home, office, or travel use. Compatible with a wide range of smartphones and accessories.",
        "image": "https://m.media-amazon.com/images/I/51VM2jCx6kL._AC_UF1000,1000_QL80_.jpg"
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