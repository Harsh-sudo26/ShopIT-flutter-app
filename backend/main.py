

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
        "description":  "Powerful A15 Bionic chip, advanced dual-camera system, and all-day battery life.",
        "image": "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/MGFH4?wid=1144&hei=1144&fmt=jpeg&qlt=90&.v=RFM5ajdVTmk3UTRqa0Y4YitiSkZsQWtuVHYzMERCZURia3c5SzJFOTlPaWVqbEpIZ1hib0hHcnQwY0VMaEZFTlZsdHpteTZuWTBPczZXaFc0Nm5DbFE"
    },
    {
        "id": 2,
        "name": "Shoes",
        "price": 1999,
        "description": "Lightweight breathable shoes designed for comfort and long-distance running.",
        "image": "https://shop.teamsg.in/cdn/shop/files/1_ee84a279-8cc7-463e-b282-a22b398f553f.png?v=1720251201"
    },
    {
        "id": 2,
        "name": "watch",
        "price": 1993539,
        "description": "Track your fitness, heart rate, and notifications with a sleek modern design.",
        "image": "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/watch-card-40-se-202603_FMT_WHH?wid=508&hei=472&fmt=p-jpg&qlt=95&.v=dFQyNjEycitpbFBFNXA5RHpaQjc1a2YwVXZvYWdoa2NXQndKNFdmSlMzdWZaQno4VzdyOTRhQU93VEhhWjgvSHg4ZHpEbm5XWGdaM3BiNVRDaG55Uk9OM1JTVGtKUFFWc0NQZFFxTkdlYUJBU25Ob2N5dVQyQmxkN0IyWWVHdW0"
    },
    {
        "id": 2,
        "name": "earbud",
        "price": 199900,
        "description": "High-quality sound with noise cancellation and long battery backup.",
        "image": "https://store.storeimages.cdn-apple.com/1/as-images.apple.com/is/airpods-pro-compare-202509_FMT_WHH?wid=286&hei=324&fmt=png-alpha&.v=ZnlNck16RHdFMkxPbVgyckcxQ295TE02ak1jaHY5MHM0UFBuZUZVbFFyc3pjWXI4WEQ3UWRkKzlNcE1ISk5kVkpsaXN3MHNidUNvd1JEcVdBVnlCQ3JoLzFaYm9hR1F3Sk1JcjJiYVozdnk1dDgvV3BhU1hoSzFPUEZjam5HQ2g"
    },
    {
        "id": 2,
        "name": "cover",
        "price": 19235399,
        "description":"Durable silicone case offering full protection with stylish design.",
        "image": "https://tiimg.tistatic.com/fp/1/007/827/comfortable-light-in-weight-durable-soft-silicone-plain-simple-mobile-cover--078.jpg"
    },
    {
        "id": 2,
        "name": "charger",
        "price": 1999,
        "description": "20W fast charging adapter for quick and safe charging.",
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