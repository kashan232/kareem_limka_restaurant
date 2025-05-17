@include('admin_panel.include.header_include')

<style>
    .search-container {
        position: relative;
        width: 100%;
        /* Adjust width as needed */
    }

    #productSearch {
        width: 100%;
        padding: 8px;
    }

    #searchResults {
        position: absolute;
        width: 100%;
        max-height: 200px;
        overflow-y: auto;
        background-color: #fff;
        border: 1px solid #ddd;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        z-index: 1000;
    }

    .search-result-item {
        padding: 10px;
        cursor: pointer;
    }

    .search-result-item:hover {
        background-color: #f0f0f0;
    }

    .sidebar {
        width: 100px !important;
    }

    .sidebar-menu-item .menu-icon {
        font-size: 24px;
        /* Adjust size as needed */
        display: flex;
        justify-content: center;
        align-items: center;
        height: 50px;
        /* Adjust to your menu item height */
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

    .discard {
        background: red;
        color: white;
    }

    .pay {
        background: green;
        color: white;
    }

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

    /* Add this to your CSS */
    .product-card {
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 2px 6px rgba(0, 0, 0, 0.1);
        background: #fff;
        display: flex;
        flex-direction: column;
        align-items: center;
        text-align: center;
        /* start invisible & slightly down */
        opacity: 0;
        transform: translateY(10px);
        /* animate in */
        animation: fadeInUp 0.4s ease forwards;
    }

    .product-card:hover {
        transform: translateY(-4px);
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
    }

    .product-card img {
        width: 100%;
        height: 120px;
        object-fit: cover;
        border-bottom: 1px solid #eee;
    }

    .product-name {
        margin: 0.75rem 0 0.25rem;
        font-size: 1rem;
        font-weight: 600;
    }

    .product-price {
        color: #28a745;
        font-weight: 700;
        margin-bottom: 0.75rem;
    }



    .order-table {
        flex: 1;
        /* take available space */
        overflow-y: auto;
        margin-bottom: 1rem;
        padding-right: 0.5rem;
    }


    /* style for each order row */
    .order-table>div {
        padding: 0.5rem 0;
        border-bottom: 1px solid #f0f0f0;
        display: flex;
        justify-content: space-between;
    }

    /* hide default scrollbar in webkit, show sleek one */
    .order-table::-webkit-scrollbar {
        width: 6px;
    }

    .order-table::-webkit-scrollbar-thumb {
        background: rgba(0, 0, 0, 0.2);
        border-radius: 3px;
    }

    /* ===== Type Buttons Row ===== */
    .order-type-buttons {
        display: flex;
        justify-content: space-between;
        margin-bottom: 1rem;
    }

    .type-btn {
        flex: 1;
        margin: 0 0.25rem;
        padding: 0.5rem 0;
        font-size: 0.9rem;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        display: flex;
        align-items: center;
        justify-content: center;
        transition: background 0.2s, color 0.2s;
    }

    .type-btn i {
        margin-right: 0.4rem;
    }

    /* Individual button colors */
    .type-btn.dine-in {
        background: #007bff;
        color: #fff;
    }

    .type-btn.take-away {
        background: #ffc107;
        color: #212529;
    }

    .type-btn.delivery {
        background: #28a745;
        color: #fff;
    }

    .type-btn.pickup {
        background: #17a2b8;
        color: #fff;
    }

    .type-btn:hover {
        opacity: 0.9;
    }

    /* ===== Totals Section ===== */
    .order-summary-wrapper {
        width: 100%;
        height: 600px;
        /* adjust kar lo apni requirement ke mutabiq */
        border: 1px solid #ddd;
        border-radius: 8px;
        padding: 2px;
        background: #fff;
        display: flex;
        flex-direction: column;
    }

    .order-table {
        flex: 1;
        /* fill the available height */
        width: 100%;
        border-collapse: collapse;
        overflow-y: auto;
        margin-bottom: 1rem;
    }

    .order-table th,
    .order-table td {
        padding: 0.2rem;
        border-bottom: 1px solid #ddd;
        text-align: center;
        font-size: 0.9rem;
    }

    .order-table tbody tr:nth-child(odd) {
        background: #fafafa;
    }

    .order-table tbody tr:nth-child(even) {
        background: #fff;
    }

    .order-totals {
        border-top: 1px solid #ddd;
        padding-top: 0.75rem;
    }

    .order-totals p {
        margin: 0.3rem 0;
        font-size: 0.95rem;
    }

    .order-totals input {
        width: 4rem;
        margin-left: 0.5rem;
        padding: 0.2rem;
    }

    .btn-void {
        background: #dc3545;
        color: #fff;
        border: none;
        padding: 0.25rem 0.5rem;
        font-size: 0.8rem;
        border-radius: 4px;
        cursor: pointer;
    }

    .qty-btn {
        padding: 4px 10px;
        font-size: 16px;
        font-weight: bold;
        border: none;
        border-radius: 5px;
        margin: 0 4px;
        color: white;
        cursor: pointer;
    }

    .btn-plus {
        background-color: #28a745;
        /* Bootstrap green */
    }

    .btn-minus {
        background-color: #dc3545;
        /* Bootstrap red */
    }

    .qty-value-input {
        width: 40px;
        padding: 6px 4px !important;
        font-size: 14px;
        text-align: center;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .qty-value {
        font-size: 16px;
        padding: 0 8px;
        display: inline-block;
        min-width: 24px;
        text-align: center;
    }

    @keyframes fadeInUp {
        from {
            opacity: 0;
            transform: translateY(10px);
        }

        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
</style>

<body>
    <!-- page-wrapper start -->
    <div class="page-wrapper default-version">

        <!-- sidebar start -->
        @include('admin_panel.include.sidebar_include')
        <!-- sidebar end -->

        <!-- navbar-wrapper start -->
        @include('admin_panel.include.navbar_include')
        <!-- navbar-wrapper end -->
        <div class="body-wrapper">
            <div class="bodywrapper__inner">
                <div class="row">
                    <div class="col-xxl-8 w-70">
                        <div class="main">
                            <div class="categories mb-3">
                                @foreach ($Category as $cat)
                                    <button class="btn btn-sm btn-primary m-1"
                                        onclick="showProductsByCategory({{ $cat->id }})">
                                        {{ $cat->category }}
                                    </button>
                                @endforeach
                            </div>
                            <div class="mb-2">
                                <button class="btn btn-outline-secondary"
                                    onclick="showProductsByUnit('Medium')">Medium</button>
                                <button class="btn btn-outline-secondary"
                                    onclick="showProductsByUnit('Large')">Large</button>
                            </div>


                            {{-- Yahaan products dikhenge --}}
                            <div id="productGrid" class="row"></div>




                            <div id="loadingSpinner" style="display:none;text-align:center;padding:20px;">
                                <div class="spinner-border text-primary" role="status"></div>
                            </div>

                            <div class="search-bar">
                                <input type="text" placeholder="Search or scan barcode" />
                            </div>

                            <div class="product-grid" id="productGrid">
                                <!-- Product buttons added dynamically -->
                            </div>

                            <div class="actions">
                                <button class="discard">Discard Sale</button>
                                <button class="btn btn-info">Recall</button>
                                <button class="btn btn-success">Take Away</button>
                                <button class="pay">Pay (F7)</button>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-4 w-30">
                        <div class="order-summary-wrapper">
                            <h3>Order Summary</h3>

                            <!-- 1) Table for order items -->
                            <table class="order-table">
                                <thead>
                                    <tr>
                                        <th>Item Name</th>
                                        <th>Qty</th>
                                        <th>Price</th>
                                        <th>Total Price</th>
                                        <th>Delete</th>
                                    </tr>
                                </thead>
                                <tbody id="orderItems">
                                    {{-- JS will append <tr> here --}}
                                </tbody>
                            </table>

                            <!-- 2) Type Buttons -->


                            <!-- 3) Totals -->
                            <div class="order-totals">
                                <p>Total Items: <span id="totalItems">0</span></p>
                                <p>Sub Total: PKR <span id="subTotal">0.00</span></p>
                                <p>Tax (10%): PKR <span id="totalTax">0.00</span></p>
                                <p>Total (with tax): PKR <span id="totalAmount">0.00</span></p>
                                <p>Discount: <input type="number" id="discount" value="0" /></p>
                                <p><strong>Total Payment:</strong> PKR <span id="totalPayment">0.00</span></p>
                            </div>
                        </div>
                    </div>








                </div><!-- bodywrapper__inner end -->
            </div><!-- body-wrapper end -->

        </div>
        @include('admin_panel.include.footer_include')




        <script>
            let selectedCategoryId = null;
            let selectedUnit = null;
            let order = [];
            
            const itemsRouteTpl = `{{ route('sale.get-items-by-category', ':category') }}`;
            const imageBase = `{{ asset('product_images') }}`;
            const allProducts = @json($AllProducts);
            
            const productGrid = document.getElementById('productGrid');
            const orderItems = document.getElementById('orderItems');
            const subTotalEl = document.getElementById('subTotal');
            const totalItemsEl = document.getElementById('totalItems');
            const totalTaxEl = document.getElementById('totalTax');
            const totalAmountEl = document.getElementById('totalAmount');
            const totalPaymentEl = document.getElementById('totalPayment');
            const discountEl = document.getElementById('discount');
            const loadingSpinner = document.getElementById('loadingSpinner');
            
            window.onload = function () {
                renderProducts(allProducts); // Initial load
            };
            
            function fetchProducts() {
                productGrid.innerHTML = '';
                loadingSpinner.style.display = 'block';
            
                if (!selectedCategoryId && !selectedUnit) {
                    renderProducts(allProducts);
                    loadingSpinner.style.display = 'none';
                    return;
                }
            
                if (selectedCategoryId) {
                    let url = itemsRouteTpl.replace(':category', selectedCategoryId);
                    if (selectedUnit) {
                        url += `?unit=${encodeURIComponent(selectedUnit)}`;
                    }
            
                    fetch(url)
                        .then(res => res.json())
                        .then(products => {
                            renderProducts(products);
                            loadingSpinner.style.display = 'none';
                        })
                        .catch(err => {
                            console.error('Fetch error:', err);
                            loadingSpinner.style.display = 'none';
                        });
                } else {
                    // if only unit is selected without category, show all
                    renderProducts(allProducts);
                    loadingSpinner.style.display = 'none';
                }
            }
            
            // Category button click
            function showProductsByCategory(categoryId) {
                selectedCategoryId = categoryId;
                console.log("Category ID:", categoryId);
                fetchProducts();
            }
            
            // Unit button click
            function showProductsByUnit(unitName) {
                selectedUnit = unitName;
                fetchProducts();
            }
            
            function renderProducts(products) {
                productGrid.innerHTML = '';
                products.forEach(p => {
                    const col = document.createElement('div');
                    col.className = 'col-md-3 mb-4';
            
                    const unitName = p.unit?.name ?? '';
            
                    col.innerHTML = `
                        <div class="product-card" onclick="addToOrder(${p.id}, '${p.product_name}', ${p.retail_price})">
                            ${p.image
                                ? `<img src="${imageBase}/${p.image}" alt="${p.product_name}">`
                                : `<div style="height:120px;background:#f0f0f0;display:flex;align-items:center;justify-content:center;">No Image</div>`}
                            <div class="product-name">${p.product_name}</div>
                            <div class="product-price">PKR ${p.retail_price} <small>(${unitName})</small></div>
                        </div>
                    `;
                    productGrid.appendChild(col);
                });
            }
            
            function addToOrder(id, name, price) {
                const existing = order.find(x => x.id === id);
                if (existing) {
                    existing.qty += 1;
                } else {
                    order.push({ id, name, price, qty: 1 });
                }
                updateOrderDisplay();
            }
            
            function updateQty(index, value) {
                const qty = parseInt(value);
                if (!isNaN(qty) && qty > 0) {
                    order[index].qty = qty;
                    updateOrderDisplay();
                }
            }
            
            function updateOrderDisplay() {
                orderItems.innerHTML = '';
                let totalItems = 0;
                let subTotal = 0;
            
                order.forEach((it, idx) => {
                    totalItems += it.qty;
                    subTotal += it.qty * it.price;
            
                    const tr = document.createElement('tr');
                    tr.innerHTML = `
                        <td>${it.name}</td>
                        <td>
                            <button class="qty-btn btn-minus" onclick="decreaseQty(${idx})">−</button>
                            <input type="number" class="qty-value-input" value="${it.qty}" min="1" onchange="updateQty(${idx}, this.value)">
                            <button class="qty-btn btn-plus" onclick="increaseQty(${idx})">+</button>
                        </td>
                        <td>${it.price.toFixed(2)}</td>
                        <td>${(it.qty * it.price).toFixed(2)}</td>
                        <td>
                            <button class="btn btn-danger btn-sm" onclick="voidItem(${idx})">
                                <i class="fa fa-trash"></i>
                            </button>
                        </td>
                    `;
                    orderItems.appendChild(tr);
                });
            
                const tax = subTotal * 0.1;
                const disc = parseFloat(discountEl.value) || 0;
                const total = subTotal + tax - disc;
            
                totalItemsEl.textContent = totalItems;
                subTotalEl.textContent = subTotal.toFixed(2);
                totalTaxEl.textContent = tax.toFixed(2);
                totalAmountEl.textContent = (subTotal + tax).toFixed(2);
                totalPaymentEl.textContent = total.toFixed(2);
            }
            
            function voidItem(index) {
                order.splice(index, 1);
                updateOrderDisplay();
            }
            
            function increaseQty(index) {
                order[index].qty += 1;
                updateOrderDisplay();
            }
            
            function decreaseQty(index) {
                if (order[index].qty > 1) {
                    order[index].qty -= 1;
                    updateOrderDisplay();
                }
            }
            
            discountEl.addEventListener('input', updateOrderDisplay);
            </script>
            
            
            

</body>
