<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>CIS ePOS Clone</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: Arial, sans-serif;
    }
    body {
      display: flex;
      height: 100vh;
      background-color: #f0f2f5;
    }
    .sidebar {
      width: 60px;
      background: #003b6f;
      color: white;
      display: flex;
      flex-direction: column;
      align-items: center;
      padding: 10px 0;
    }
    .sidebar .icon {
      margin: 15px 0;
      font-size: 20px;
      cursor: pointer;
    }
    .main {
      flex: 1;
      display: flex;
      flex-direction: column;
      padding: 20px;
    }
    .categories {
      display: flex;
      gap: 10px;
      margin-bottom: 10px;
    }
    .categories button {
      padding: 10px;
      border: none;
      background: #eaeaea;
      border-radius: 5px;
      cursor: pointer;
    }
    .search-bar input {
      width: 100%;
      padding: 10px;
      margin: 10px 0;
    }
    .product-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(120px, 1fr));
      gap: 10px;
      overflow-y: auto;
      padding-right: 10px;
    }
    .product {
      background: white;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      text-align: center;
      cursor: pointer;
    }
    .actions {
      display: flex;
      gap: 10px;
      margin-top: auto;
      padding-top: 10px;
    }
    .actions button {
      padding: 10px 15px;
      border: none;
      border-radius: 5px;
    }
    .discard { background: red; color: white; }
    .pay { background: green; color: white; }

    .order-summary {
      width: 350px;
      background: white;
      border-left: 1px solid #ccc;
      padding: 20px;
    }
    .order-summary h3 {
      margin-bottom: 10px;
    }
    .order-items {
      max-height: 200px;
      overflow-y: auto;
      margin-bottom: 15px;
    }
    .order-items div {
      display: flex;
      justify-content: space-between;
      border-bottom: 1px solid #ddd;
      padding: 5px 0;
    }
    .order-totals div {
      margin-bottom: 5px;
    }
    .order-totals input {
      width: 60px;
      padding: 5px;
    }
  </style>
</head>
<body>
  <div class="sidebar">
    <div class="icon">☰</div>
    <div class="icon">🏠</div>
    <div class="icon">📦</div>
    <div class="icon">🧾</div>
    <div class="icon">⚙️</div>
  </div>

  <div class="main">
    <div class="categories">
      <button>Dinner</button>
      <button>Lunch</button>
      <button>Breakfast</button>
      <button>Beverages</button>
    </div>

    <div class="search-bar">
      <input type="text" placeholder="Search or scan barcode" />
    </div>

    <div class="product-grid" id="productGrid">
      <!-- Product buttons added dynamically -->
    </div>

    <div class="actions">
      <button class="discard">Discard Sale</button>
      <button>Recall</button>
      <button>KOT</button>
      <button class="pay">Pay (F7)</button>
    </div>
  </div>

  <div class="order-summary">
    <h3>Order Summary</h3>
    <div class="order-items" id="orderItems"></div>
    <div class="order-totals">
      <div>Total Items: <span id="totalItems">0</span></div>
      <div>Sub Total: PKR <span id="subTotal">0</span></div>
      <div>Total Tax: PKR <span id="totalTax">0</span></div>
      <div>Total: PKR <span id="totalAmount">0</span></div>
      <div>Bill Discount: <input type="number" id="discount" value="0" /> PKR</div>
      <div>Total Payment: <strong>PKR <span id="totalPayment">0</span></strong></div>
    </div>
  </div>

  <script>
    const products = [
      { name: 'Chicken Biryani', price: 150 },
      { name: 'Beef Biryani', price: 180 },
      { name: 'Lays Masala', price: 650 },
      { name: 'Knorr Chicken Cubes', price: 180 },
      { name: 'Tea', price: 50 },
      { name: 'Omlet', price: 100 },
    ];

    const productGrid = document.getElementById('productGrid');
    const orderItems = document.getElementById('orderItems');
    const subTotalEl = document.getElementById('subTotal');
    const totalItemsEl = document.getElementById('totalItems');
    const totalTaxEl = document.getElementById('totalTax');
    const totalAmountEl = document.getElementById('totalAmount');
    const totalPaymentEl = document.getElementById('totalPayment');
    const discountEl = document.getElementById('discount');

    let order = [];

    function updateOrderDisplay() {
      orderItems.innerHTML = '';
      let totalItems = 0;
      let subTotal = 0;
      order.forEach((item, index) => {
        totalItems += item.qty;
        subTotal += item.qty * item.price;
        const div = document.createElement('div');
        div.innerHTML = `${item.name} x${item.qty} <span>PKR ${item.qty * item.price}</span>`;
        orderItems.appendChild(div);
      });

      const tax = subTotal * 0.1;
      const discount = parseFloat(discountEl.value || 0);
      const total = subTotal + tax - discount;

      totalItemsEl.textContent = totalItems;
      subTotalEl.textContent = subTotal.toFixed(2);
      totalTaxEl.textContent = tax.toFixed(2);
      totalAmountEl.textContent = (subTotal + tax).toFixed(2);
      totalPaymentEl.textContent = total.toFixed(2);
    }

    products.forEach((product) => {
      const div = document.createElement('div');
      div.className = 'product';
      div.textContent = product.name;
      div.onclick = () => {
        const existing = order.find(p => p.name === product.name);
        if (existing) {
          existing.qty += 1;
        } else {
          order.push({ ...product, qty: 1 });
        }
        updateOrderDisplay();
      };
      productGrid.appendChild(div);
    });

    discountEl.addEventListener('input', updateOrderDisplay);
  </script>
</body>
</html>