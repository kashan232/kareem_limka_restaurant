<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="csrf-token" content="{{ csrf_token() }}">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <title>Restaurant POS</title>
    <style>
        body {
            background-color: #f0f2f5;
            font-family: 'Poppins', sans-serif;
        }

        .pos-header {
            background-color: #000;
            color: #fff;
            padding: 20px;
            text-align: center;
            font-size: 24px;
            font-weight: bold;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }

        .category-section,
        .subcategory-section {
            background-color: #fff;
            padding: 15px;
            border-radius: 10px;
            margin-bottom: 15px;
        }

        .product-section {
            background-color: #eaeaea;
            padding: 15px;
            border-radius: 10px;
            height: 500px;
            overflow-y: auto;
        }

        .product-card {
            background-color: #fff;
            border: 1px solid #ddd;
            padding: 15px;
            margin-bottom: 15px;
            border-radius: 10px;
            text-align: center;
            cursor: pointer;
            transition: transform 0.3s, box-shadow 0.3s;
        }

        .product-card:hover {
            transform: scale(1.05);
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.1);
        }

        .bill-section {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            min-height: 400px;
        }

        .bill-footer {
            background-color: #eaeaea;
            padding: 15px;
            border-top: 1px solid #ddd;
            margin-top: 10px;
            display: flex;
            justify-content: space-between;
            font-weight: bold;
        }

        /* Buttons default */
        .btn-category,
        .btn-units {
            background-color: #e0e0e0;
            /* light gray */
            color: #333;
            border: none;
            padding: 10px 20px;
            margin: 5px;
            cursor: pointer;
            border-radius: 5px;
            transition: background-color 0.3s, color 0.3s;
        }

        /* Active buttons */
        .btn-category.active,
        .btn-units.active {
            background-color: #000;
            /* black */
            color: #fff;
        }

        .bill-footer {
            background-color: #eaeaea;
            padding: 15px 20px;
            border-top: 1px solid #ddd;
            margin-top: 10px;
            display: flex;
            flex-direction: column;
            gap: 10px;
            font-weight: 600;
            font-size: 16px;
            color: #333;
        }

        .bill-footer span {
            display: flex;
            justify-content: space-between;
            padding: 5px 0;
            border-bottom: 1px solid #ccc;
        }

        .bill-footer span:last-child {
            font-size: 18px;
            font-weight: 700;
            border-bottom: none;
        }

        .bill-section h5 {
            margin-bottom: 20px;
            font-weight: 700;
            border-bottom: 2px solid #4ba064;
            padding-bottom: 5px;
        }
    </style>
</head>

<body>

    <div class="container-fluid">
        <div class="pos-header d-flex align-items-center justify-content-center gap-3 mb-3">
            <img src="{{ asset('assets/images/logo.JPG') }}" alt="Logo" style="width: 150px; height: auto; border-radius: 8px; box-shadow: 0px 4px 6px rgba(0,0,0,0.1);">
            <div>
                <h3 class="text-white fw-bold mb-0" style="font-size: 1.8rem;">Restaurant POS</h3>
            </div>
        </div>

        <div class="mb-3 d-flex align-items-center gap-4 mt-3 mb-3">
            <h5 class="mb-0" style="min-width: 120px;">Order Type:</h5>
            <div class="btn-group" role="group" aria-label="Order Type">
                <!-- Use radios for mutually exclusive selection -->
                <input type="radio" class="btn-check" name="order_type" id="dine-in" autocomplete="off" checked>
                <label class="btn btn-outline-dark" for="dine-in">Dine-In</label>

                <input type="radio" class="btn-check" name="order_type" id="takeaway" autocomplete="off">
                <label class="btn btn-outline-dark" for="takeaway">Takeaway</label>

                <input type="radio" class="btn-check" name="order_type" id="delivery" autocomplete="off">
                <label class="btn btn-outline-dark" for="delivery">Delivery</label>
            </div>
        </div>

        <!-- Table Selection -->
        <div class="mb-3 d-flex align-items-center gap-3 flex-wrap">
            <h5 class="mb-0">Select Table:</h5>
            @foreach($tables as $table)
            <div class="card p-3 mb-2" style="height: 120px; width: 150px; background-color: #f8f9fa; cursor: pointer; display: flex; align-items: center; justify-content: center; position: relative;">
                <input type="radio" class="btn-check" name="table" id="table-{{ $table->id }}" value="{{ $table->id }}" autocomplete="off">
                <label class="btn btn-outline-dark w-100 text-center" for="table-{{ $table->id }}">{{ $table->table_name }}</label>
                <hr style="width: 100%; position: absolute; bottom: 0; left: 0; border: 0; border-top: 1px solid #ddd;">
            </div>
            @endforeach
        </div>

        <div class="row mt-4">
            <div class="col-md-6">
                <div class="category-section mb-3">
                    <h5>Categories</h5>
                    @foreach($Category as $cat)
                    <button type="button"
                        class="btn btn-primary btn-category"
                        onclick="selectCategory(this)"
                        data-category-id="{{ $cat->id }}">
                        {{ $cat->category }}
                    </button>
                    @endforeach
                </div>

                <div class="subcategory-section mb-3">
                    <h5>Units</h5>
                    @foreach($Units as $Unit)
                    <button type="button"
                        class="btn btn-outline-secondary btn-units"
                        onclick="selectUnit(this)"
                        data-unit-id="{{ $Unit->id }}">
                        {{ $Unit->unit }}
                    </button>
                    @endforeach
                </div>

                <div class="mb-3">
                    <input type="text" id="product-search" class="form-control" placeholder="Search Products" oninput="filterProducts()">
                </div>
                <div class="product-section">
                    <div class="row">
                        @foreach($AllProducts as $product)
                        <div class="col-md-3 mb-3">
                            <div class="product-card border p-2 text-center" onclick="addToBill({{ $product->id }}, '{{ $product->product_name }}', {{ $product->retail_price }})"
                                style="cursor:pointer;">
                                <img src="{{ asset('product_images/' . $product->image) }}" alt="{{ $product->product_name }}" style="width: 100px; height: 100px; object-fit: cover;">

                                <h6 class="mt-2">{{ $product->product_name }}</h6>
                                <p>RS. {{ number_format($product->retail_price, 2) }}</p>
                            </div>
                        </div>
                        @endforeach
                    </div>
                </div>
            </div>

            <div class="col-md-6">
                <div class="bill-section">
                    <h5>Bill</h5>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Product Name</th>
                                <th>Quantity</th>
                                <th>Unit Price</th>
                                <th>Total Price</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody id="bill-items">
                            <!-- Bill rows inserted here dynamically -->
                        </tbody>
                        <tfoot>
                            <tr>
                                <td colspan="6" class="text-end">
                                    Total Items: <span id="total-items">0</span>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5" class="text-end">Subtotal (PKR):</td>
                                <td id="sub-total">PKR 0.00</td>
                            </tr>
                            <tr>
                                <td colspan="5" class="text-end">Discount:</td>
                                <td>
                                    <input type="number" id="discount-input" min="0" value="0" step="0.01" oninput="applyDiscount()" class="form-control" style="width: 120px;">
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5" class="text-end"><strong>Total Payment (PKR):</strong></td>
                                <td id="total-payment"><strong>PKR 0.00</strong></td>
                            </tr>
                        </tfoot>
                    </table>

                </div>
            </div>
        </div>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        let selectedCategoryId = null;
        let selectedUnit = null;
        let billItems = [];

        function selectCategory(btn) {
            document.querySelectorAll('.btn-category').forEach(b => b.classList.remove('active'));
            btn.classList.add('active');

            selectedCategoryId = btn.getAttribute('data-category-id');
            fetchProducts();
        }

        function selectUnit(btn) {
            document.querySelectorAll('.btn-units').forEach(b => b.classList.remove('active'));
            btn.classList.add('active');

            // Ab yahan unit ka id le rahe hain, naam nahi
            selectedUnit = btn.getAttribute('data-unit-id');
            fetchProducts();
        }

        function fetchProducts() {
            const url = "{{ route('get-pos-products') }}";

            $.ajax({
                url: url,
                method: "GET",
                data: {
                    category_id: selectedCategoryId,
                    unit: selectedUnit
                },
                success: function(response) {
                    let products = response;
                    if (response.data) {
                        products = response.data;
                    }
                    displayProducts(products);
                },
                error: function(xhr, status, error) {
                    console.error('AJAX Error:', error);
                }
            });
        }

        function displayProducts(products) {
            const productsContainer = document.querySelector('.product-section .row');
            productsContainer.innerHTML = '';

            if (products.length > 0) {
                products.forEach(product => {
                    const imageUrl = "{{ asset('product_images') }}/" + product.image;

                    productsContainer.innerHTML += `
                <div class="col-md-3 mb-3">
                    <div class="product-card border p-2 text-center" onclick="addToBill(${product.id}, '${product.name}', ${parseFloat(product.price).toFixed(2)})"
style="cursor:pointer;">
                        <img src="${imageUrl}" alt="${product.name}" style="width: 100px; height: 100px; object-fit: cover;">
                        <h6 class="mt-2">${product.name}</h6>
                        <p>RS. ${parseFloat(product.price).toFixed(2)}</p>
                    </div>
                </div>
            `;
                });
            } else {
                productsContainer.innerHTML = `
            <div class="col-12">
                <p class="text-center text-muted">No products found.</p>
            </div>
        `;
            }
        }


        function addToBill(id, name, price) {
            price = parseFloat(price);
            const existingItem = billItems.find(item => item.id === id);

            if (existingItem) {
                existingItem.quantity += 1;
                existingItem.total = existingItem.quantity * existingItem.price;
            } else {
                billItems.push({
                    id: id,
                    name: name,
                    quantity: 1,
                    price: price,
                    total: price
                });
            }
            renderBill();
        }

        function renderBill() {
            const billBody = document.getElementById('bill-items');
            billBody.innerHTML = '';

            let totalItems = 0;
            let subTotal = 0;

            billItems.forEach((item, index) => {
                totalItems += item.quantity;
                subTotal += item.total;

                billBody.innerHTML += `
            <tr>
                <td>${index + 1}</td>
                <td>${item.name}</td>
                <td>
                    <input type="number" min="1" value="${item.quantity}" style="width: 60px;" onchange="updateQuantity(${index}, this.value)">
                </td>
                <td>RS. ${item.price.toFixed(2)}</td>
                <td>RS. ${item.total.toFixed(2)}</td>
                <td><button class="btn btn-danger btn-sm" onclick="removeItem(${index})"><i class="fa fa-trash"></i></button></td>
            </tr>
            `;
            });

            document.getElementById('total-items').textContent = totalItems;
            document.getElementById('sub-total').textContent = `PKR ${subTotal.toFixed(2)}`;

            applyDiscount(); // Recalculate total payment after rendering bill
        }

        function updateQuantity(index, qty) {
            qty = parseInt(qty);
            if (qty < 1 || isNaN(qty)) {
                qty = 1;
            }
            billItems[index].quantity = qty;
            billItems[index].total = billItems[index].price * qty;
            renderBill();
        }

        function removeItem(index) {
            billItems.splice(index, 1);
            renderBill();
        }

        function applyDiscount() {
            let discountValue = parseFloat(document.getElementById('discount-input').value);
            if (isNaN(discountValue) || discountValue < 0) discountValue = 0;

            let subTotalText = document.getElementById('sub-total').textContent;
            let subTotal = parseFloat(subTotalText.replace(/[^\d.-]/g, ''));

            let totalPayment = subTotal - discountValue;
            if (totalPayment < 0) totalPayment = 0;

            document.getElementById('total-payment').innerHTML = `<strong>PKR ${totalPayment.toFixed(2)}</strong>`;
        }

        // Filter products on search input
        function filterProducts() {
            const query = document.getElementById('product-search').value.toLowerCase();
            const productCards = document.querySelectorAll('.product-card');

            productCards.forEach(card => {
                const name = card.querySelector('h6').textContent.toLowerCase();
                if (name.includes(query)) {
                    card.parentElement.style.display = '';
                } else {
                    card.parentElement.style.display = 'none';
                }
            });
        }
    </script>





</body>

</html>