<div class="order-tracking-page">
    <div class="container my-5">
        <div class="order-header">
            <h1>Order #$Order.ID</h1>
            <div class="order-meta">
                <span class="order-date">Placed on: $Order.Created.Nice</span>
                <span class="order-status $Order.Status">Status: $Order.Status</span>
            </div>
        </div>

        <div class="row mt-4">
            <div class="col-md-8">
                <div class="order-progress">
                    <div class="progress-track">
                        <% loop $Order.StatusSteps %>
                            <div class="step $Active">
                                <span class="icon">
                                    <i class="fas fa-$Icon"></i>
                                </span>
                                <span class="step-label">$Label</span>
                                <% if $Timestamp %>
                                    <span class="timestamp">$Timestamp.Nice</span>
                                <% end_if %>
                            </div>
                        <% end_loop %>
                    </div>
                </div>

                <div class="order-items mt-4">
                    <h3>Order Items</h3>
                    <div class="items-list">
                        <% loop $Order.OrderItems %>
                            <div class="order-item">
                                <div class="item-image">
                                    $MenuItem.Image.Fill(80,80)
                                </div>
                                <div class="item-details">
                                    <h4>$MenuItem.Name</h4>
                                    <p class="item-price">$Price.Nice x $Quantity</p>
                                    <% if $SpecialInstructions %>
                                        <p class="special-instructions">Note: $SpecialInstructions</p>
                                    <% end_if %>
                                </div>
                                <div class="item-total">
                                    $Total.Nice
                                </div>
                            </div>
                        <% end_loop %>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="order-summary">
                    <h3>Order Summary</h3>
                    <div class="summary-item">
                        <span>Subtotal</span>
                        <span>$Order.SubTotal.Nice</span>
                    </div>
                    <div class="summary-item">
                        <span>Delivery Fee</span>
                        <span>$Order.DeliveryFee.Nice</span>
                    </div>
                    <% if $Order.Discount %>
                        <div class="summary-item discount">
                            <span>Discount</span>
                            <span>-$Order.Discount.Nice</span>
                        </div>
                    <% end_if %>
                    <div class="summary-item total">
                        <span>Total</span>
                        <span>$Order.TotalAmount.Nice</span>
                    </div>
                </div>

                <div class="delivery-info mt-4">
                    <h3>Delivery Information</h3>
                    <div class="info-item">
                        <i class="fas fa-map-marker-alt"></i>
                        <span>$Order.DeliveryAddress</span>
                    </div>
                    <% if $Order.DeliveryInstructions %>
                        <div class="info-item">
                            <i class="fas fa-info-circle"></i>
                            <span>$Order.DeliveryInstructions</span>
                        </div>
                    <% end_if %>
                    <% if $Order.EstimatedDeliveryTime %>
                        <div class="info-item">
                            <i class="fas fa-clock"></i>
                            <span>Estimated Delivery: $Order.EstimatedDeliveryTime.Nice</span>
                        </div>
                    <% end_if %>
                </div>

                <% if $Order.CanBeCancelled %>
                    <div class="order-actions mt-4">
                        <button class="btn btn-danger w-100" data-bs-toggle="modal" data-bs-target="#cancelOrderModal">
                            Cancel Order
                        </button>
                    </div>
                <% end_if %>
            </div>
        </div>
    </div>
</div>

<% if $Order.CanBeCancelled %>
    <div class="modal fade" id="cancelOrderModal" tabindex="-1">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title">Cancel Order</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>
                <div class="modal-body">
                    <p>Are you sure you want to cancel this order? This action cannot be undone.</p>
                    $CancelOrderForm
                </div>
            </div>
        </div>
    </div>
<% end_if %>