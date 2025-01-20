<div class="restaurant-page">
    <div class="hero-section" style="background-image: url('$Restaurant.FeaturedImage.URL')">
        <div class="container">
            <div class="hero-content">
                <h1>$Restaurant.Name</h1>
                <p class="lead">$Restaurant.Description</p>
                <div class="restaurant-meta">
                    <span class="cuisine-type">$Restaurant.CuisineType</span>
                    <span class="rating">★ $Restaurant.AverageRating</span>
                </div>
            </div>
        </div>
    </div>

    <div class="container my-5">
        <div class="row">
            <div class="col-md-8">
                <div class="menu-section">
                    <h2>Menu</h2>
                    <% loop $Restaurant.MenuCategories %>
                        <div class="menu-category" id="category-$ID">
                            <h3>$Name</h3>
                            <div class="menu-items">
                                <% loop MenuItems %>
                                    <div class="menu-item" data-item-id="$ID">
                                        <div class="menu-item-content">
                                            <% if $Image %>
                                                <div class="menu-item-image">
                                                    $Image.Fill(120,120)
                                                </div>
                                            <% end_if %>
                                            <div class="menu-item-details">
                                                <h4>$Name</h4>
                                                <p>$Description</p>
                                                <div class="menu-item-meta">
                                                    <span class="price">$Price.Nice</span>
                                                    <% if $IsAvailable %>
                                                        <button class="btn btn-sm btn-primary add-to-cart" 
                                                                data-item-id="$ID" 
                                                                data-item-name="$Name" 
                                                                data-item-price="$Price">
                                                            Add to Cart
                                                        </button>
                                                    <% else %>
                                                        <span class="badge bg-secondary">Unavailable</span>
                                                    <% end_if %>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                <% end_loop %>
                            </div>
                        </div>
                    <% end_loop %>
                </div>
            </div>

            <div class="col-md-4">
                <div class="order-sidebar sticky-top">
                    <div class="cart-section">
                        <h3>Your Order</h3>
                        <div id="cart-items"></div>
                        <div class="cart-summary">
                            <div class="subtotal">
                                <span>Subtotal:</span>
                                <span id="cart-subtotal">$0.00</span>
                            </div>
                            <div class="delivery-fee">
                                <span>Delivery Fee:</span>
                                <span id="delivery-fee">$5.00</span>
                            </div>
                            <div class="total">
                                <span>Total:</span>
                                <span id="cart-total">$0.00</span>
                            </div>
                        </div>
                        <button class="btn btn-primary w-100" id="checkout-button">
                            Proceed to Checkout
                        </button>
                    </div>

                    <div class="restaurant-info mt-4">
                        <h4>Restaurant Information</h4>
                        <div class="info-item">
                            <i class="fas fa-map-marker-alt"></i>
                            <span>$Restaurant.Address</span>
                        </div>
                        <div class="info-item">
                            <i class="fas fa-phone"></i>
                            <span>$Restaurant.Phone</span>
                        </div>
                        <div class="info-item">
                            <i class="fas fa-clock"></i>
                            <span>$Restaurant.OperatingHours</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>