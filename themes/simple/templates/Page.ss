<!DOCTYPE html>
<html lang="$ContentLocale">
<head>
    <% base_tag %>
    <title>$Title &raquo; $SiteConfig.Title</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <% require css("themes/restaurant/css/bootstrap.min.css") %>
    <% require css("themes/restaurant/css/main.css") %>
    $MetaTags(false)
</head>
<body class="$ClassName.LowerCase">
    <header class="main-header">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container">
                <a class="navbar-brand" href="$BaseHref">
                    <% if $SiteConfig.Logo %>
                        $SiteConfig.Logo.SetWidth(200)
                    <% else %>
                        $SiteConfig.Title
                    <% end_if %>
                </a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarMain">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarMain">
                    <% include Navigation %>
                    <div class="ms-auto">
                        <% if $CurrentMember %>
                            <div class="dropdown">
                                <button class="btn btn-outline-primary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                    $CurrentMember.FirstName
                                </button>
                                <ul class="dropdown-menu">
                                    <li><a class="dropdown-item" href="account/profile">Profile</a></li>
                                    <li><a class="dropdown-item" href="account/orders">My Orders</a></li>
                                    <li><a class="dropdown-item" href="account/reservations">My Reservations</a></li>
                                    <li><hr class="dropdown-divider"></li>
                                    <li><a class="dropdown-item" href="Security/Logout">Logout</a></li>
                                </ul>
                            </div>
                        <% else %>
                            <a href="Security/Login" class="btn btn-outline-primary me-2">Login</a>
                            <a href="Security/Register" class="btn btn-primary">Register</a>
                        <% end_if %>
                    </div>
                </div>
            </div>
        </nav>
    </header>

    <main role="main">
        $Layout
    </main>

    <footer class="main-footer bg-light mt-5 py-4">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <h5>About Us</h5>
                    $SiteConfig.FooterContent
                </div>
                <div class="col-md-4">
                    <h5>Quick Links</h5>
                    <% include FooterNavigation %>
                </div>
                <div class="col-md-4">
                    <h5>Contact</h5>
                    <p>$SiteConfig.ContactEmail</p>
                    <p>$SiteConfig.ContactPhone</p>
                </div>
            </div>
            <div class="row mt-4">
                <div class="col text-center">
                    <p>&copy; $Now.Year $SiteConfig.Title. All rights reserved.</p>
                </div>
            </div>
        </div>
    </footer>

    <% require javascript("themes/restaurant/javascript/bootstrap.bundle.min.js") %>
    <% require javascript("themes/restaurant/javascript/main.js") %>
    $Form.RequiresJavascript
</body>
</html>