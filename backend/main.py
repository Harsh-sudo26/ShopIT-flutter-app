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
    "description": "The Apple iPhone 14 combines elegant design with powerful performance, making it ideal for everyday use. It features a 6.1-inch Super Retina XDR display that delivers sharp visuals, deep blacks, and vibrant colors for an immersive viewing experience. Powered by the A15 Bionic chip, it ensures smooth multitasking, fast app launches, and efficient battery performance. The advanced dual-camera system allows you to capture stunning photos and cinematic videos, even in low-light conditions. With safety features like Crash Detection and Emergency SOS via satellite, it adds an extra layer of security to your daily life.",
    "image": "https://m.media-amazon.com/images/I/61bK6PMOC3L._SL1500_.jpg"
  },
  {
    "id": 2,
    "name": "realnme",
    "price": 1999,
    "description": "These lightweight and breathable shoes are designed to provide maximum comfort and performance throughout the day. Made with high-quality mesh fabric, they allow proper airflow to keep your feet cool and dry during long walks, runs, or workouts. The cushioned sole offers excellent shock absorption, reducing stress on your feet and joints. Their flexible design ensures natural movement, while the durable outsole provides strong grip and stability. Perfect for gym sessions, running, or casual daily wear.",
    "image": "https://sell.gameloot.in/wp-content/uploads/sites/4/2024/01/phone.jpg"
  },
  {
    "id": 3,
    "name": "Watch",
    "price": 1939,
    "description": "This modern smartwatch is built to keep you connected, active, and informed throughout your day. It tracks your daily activities including steps, calories burned, heart rate, and sleep patterns with high accuracy. With smart notifications, you can receive calls, messages, and app alerts directly on your wrist without checking your phone. The sleek and stylish design makes it suitable for both casual and formal occasions. Its long-lasting battery ensures uninterrupted usage, making it a reliable companion for fitness and lifestyle tracking.",
    "image": "https://m.media-amazon.com/images/I/61y2VVWcGBL._SL1500_.jpg"
  },
  {
    "id": 4,
    "name": "Earbuds",
    "price": 19900,
    "description": "Experience premium audio quality with these wireless earbuds designed for comfort and performance. Equipped with advanced noise cancellation technology, they block out unwanted background noise, allowing you to fully immerse yourself in music or calls. The ergonomic design ensures a secure and comfortable fit for long listening sessions. With deep bass, clear vocals, and balanced sound, they deliver an exceptional audio experience. The compact charging case provides extended battery life, making them perfect for travel, workouts, and daily use.",
    "image": "https://m.media-amazon.com/images/I/61SUj2aKoEL._SL1500_.jpg"
  },
  {
    "id": 5,
    "name": "Cover",
    "price": 19299,
    "description": "Protect your smartphone with this durable and stylish silicone case designed for everyday use. The soft-touch material offers a comfortable grip while effectively safeguarding your device from scratches, accidental drops, and minor impacts. Its slim and lightweight design adds minimal bulk, preserving the original look of your phone. Precise cutouts ensure easy access to buttons, ports, and camera without any inconvenience. A perfect blend of protection, functionality, and style.",
    "image": "https://m.media-amazon.com/images/I/61uhVZC1UqL._SL1500_.jpg"
  },
  {
    "id": 6,
    "name": "Charger",
    "price": 1999,
    "description": "This 20W fast charging adapter is engineered to deliver quick and efficient power to your devices. With advanced safety features, it protects against overheating, overcharging, and short circuits, ensuring safe usage at all times. Its compact and lightweight design makes it easy to carry in your bag or pocket, making it ideal for travel, office, or home use. Compatible with a wide range of smartphones and accessories, it provides reliable and consistent performance.",
    "image": "https://brownliving.in/cdn/shop/products/biodegradable-eco-friendly-wheat-straw-phone-case-mobile-cover-pacific-blue-177-13090-agc-hk-13-008-tech-accessories-brown-living-555270.jpg?v=1682960778"
  },
  {
    "id": 7,
    "name": "Laptop",
    "price": 65999,
    "description": "This high-performance laptop is designed to handle both productivity and entertainment with ease. Powered by a fast processor and supported by ample RAM, it ensures smooth multitasking, quick application launches, and seamless performance. The full HD display offers sharp visuals and vibrant colors, enhancing your viewing experience whether you're working, streaming, or gaming. With a long-lasting battery and a sleek design, it is perfect for students, professionals, and gamers on the go.",
    "image": "https://m.media-amazon.com/images/I/71jG+e7roXL._SL1500_.jpg"
  },
  {
    "id": 8,
    "name": "Backpack",
    "price": 1499,
    "description": "This versatile backpack is designed for daily use, combining durability, comfort, and style. It features multiple spacious compartments to keep your belongings organized, including a dedicated section for laptops and accessories. The padded shoulder straps ensure maximum comfort even during long hours of use, while the water-resistant material protects your items from unexpected weather conditions. Ideal for school, college, travel, and work.",
    "image": "https://icon.in/cdn/shop/files/1_50b8664b-0c2b-477a-9d86-ed6fce060859.jpg?v=1756985540&width=1946"
  },
  {
    "id": 9,
    "name": "Gaming Mouse",
    "price": 1299,
    "description": "Upgrade your gaming setup with this high-precision gaming mouse designed for speed and accuracy. It features adjustable DPI settings for customized sensitivity, allowing you to perform better in competitive gameplay. The ergonomic design ensures a comfortable grip for long gaming sessions, reducing hand fatigue. With programmable buttons and vibrant RGB lighting, it adds both functionality and style to your gaming experience.",
    "image": "https://m.media-amazon.com/images/I/61mpMH5TzkL._SL1500_.jpg"
  },
  {
    "id": 10,
    "name": "Keyboard",
    "price": 2499,
    "description": "This mechanical keyboard delivers a premium typing and gaming experience with its tactile feedback and durable switches. Designed for long-term use, it offers fast response times and high precision, making it suitable for both gamers and professionals. The customizable RGB lighting enhances its appearance, while the sturdy build ensures reliability. Its ergonomic layout improves typing comfort and efficiency.",
    "image": "https://m.media-amazon.com/images/I/71kr3WAj1FL._SL1500_.jpg"
  },
  {
    "id": 11,
    "name": "Power Bank",
    "price": 1799,
    "description": "Stay connected wherever you go with this high-capacity power bank. It supports fast charging and allows you to charge multiple devices simultaneously. Its compact and lightweight design makes it easy to carry during travel or daily commutes. Built with advanced safety features, it protects your devices from overcharging and overheating, ensuring reliable performance at all times.",
    "image": "https://m.media-amazon.com/images/I/71lVwl3q-kL._SL1500_.jpg"
  },
  {
    "id": 12,
    "name": "Bluetooth Speaker",
    "price": 2999,
    "description": "Enjoy powerful and immersive sound with this portable Bluetooth speaker. It delivers deep bass, clear vocals, and balanced audio for an enhanced listening experience. The long battery life ensures uninterrupted music playback, while its water-resistant design makes it suitable for outdoor use, parties, and travel. Easy connectivity allows seamless pairing with your devices.",
    "image": "https://avstore.in/cdn/shop/files/1.AVStore-JBL-PartyBox-Encore-Essential-Portable-Bluetooth-Speaker-With-Light-Display-Front-Angled-View-Hero.jpg?v=1682414405"
  },
  {
    "id": 13,
    "name": "Smart TV",
    "price": 39999,
    "description": "Experience entertainment like never before with this 4K smart TV featuring ultra-high-definition resolution and vibrant colors. It comes with built-in streaming apps such as Netflix and YouTube, allowing you to enjoy your favorite shows and movies effortlessly. The smart interface and voice control features provide a convenient and modern viewing experience. Its sleek design enhances the look of your living space.",
    "image": "https://s3.infra.brandquad.io/accounts-media/SHRP/DAM/origin/5ed1ddf8-4e73-11ef-a427-bea7e36404f4.jpg"
  },
  {
    "id": 14,
    "name": "Headphones",
    "price": 3499,
    "description": "These over-ear headphones are designed to deliver immersive sound quality with excellent noise isolation. The cushioned ear cups provide superior comfort, making them ideal for long listening sessions. With a foldable and lightweight design, they are easy to carry and store. Perfect for music, movies, and gaming, they offer a rich and balanced audio experience.",
    "image": "https://m.media-amazon.com/images/I/61CGHv6kmWL._SL1500_.jpg"
  },
  {
    "id": 15,
    "name": "Tablet",
    "price": 25999,
    "description": "This sleek and lightweight tablet is perfect for both entertainment and productivity. It features a large high-resolution display for an enjoyable viewing experience, whether you're watching videos, reading, or browsing. Powered by a fast processor, it ensures smooth performance for multitasking. Its portable design and long battery life make it an ideal companion for travel and daily use.",
    "image": "https://m.media-amazon.com/images/I/71O5U+2PKWL._AC_UF1000,1000_QL80_.jpg"
  },
  {
    "id": 16,
    "name": "Fitness Band",
    "price": 1999,
    "description": "Track your health and fitness goals with this advanced fitness band. It monitors your daily activities such as steps, calories burned, heart rate, and sleep patterns with high accuracy. The lightweight and water-resistant design ensures comfortable all-day wear. With a long battery life and smart notifications, it keeps you connected while helping you maintain a healthy lifestyle.",
    "image": "https://furper.com/cdn/shop/products/xiaomi-mi-band-8-fitness-band-with-spo2-sensor-162-inch-amoled-display-smart-band-xiaomi-black-185546_large.jpg?v=1682013540"
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