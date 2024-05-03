<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="store.management.model.Product" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Store Management System</title>
    <!-- Bootstrap CSS -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <style>
       body{
        background-color: black;
        color:white;
        margin: 0 3%;
        padding: 0;
        background-image: url('https://img.freepik.com/premium-photo/shopping-cart-sale-black-background-copy-space-symbol-decoration-ornament-cyber-monday-black-friday-sale-50-fifty-percent-offer-discount-business-online-shopping-promotion-commercial-store-retail_178037-1094.jpg');
        background-size: cover;
        
    }
       a{
        color:whitesmoke;
       }
       hr{
        background-color: aliceblue;
       }
       #logo{
        font-family: Myriad;
        background-image: linear-gradient(
            to bottom,
            #462523 0,
                #cb9b51 22%, 
            #f6e27a 45%,
            #f6f2c0 50%,
            #f6e27a 55%,
            #cb9b51 78%,
            #462523 100%
            );
        color:transparent;
        -webkit-background-clip:text;
        
       }
    #Form{
        position: absolute;
        top: 50%;
        left: 50%;
        z-index: 999;
        
        width: 750px;
        transform: translate(-50%,-50%);
        background: rgba(255,255,255,0.04);
        box-shadow: -1px 4px 28px 0px rgba(0,0,0,0.75);
    }
       
    </style>
</head>
<body>
    <div>
        <div class="row ">
            <div class="col d-flex justify-content-center">
                <h1 class="text-center" id="logo">Store Management System</h1>
            </div>
            <div class="d-flex justify-content-end">
                <h5 class="text-end">Sai tarun</h5>
            </div>
        </div>
        <nav class="navbar navbar-expand-lg navbar-light justify-content-between d-flex ">
            
            <div class="w-100 "> 
                <ul class="navbar-nav justify-content-between">
                    <li class="nav-item active">
                        <a class="nav-link text-light" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                   
                    <li class="nav-item dropdown">
                    <a class="nav-link text-light dropdown-toggle" href="#" id="navbarDropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Report
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
                        <a id="generateDailyReportBtn" class="dropdown-item" href="/DailyReport">Daily Report</a>
                        <a id="generateWeeklyReportBtn" class="dropdown-item" href="/WeeklyReport">Weekly Report</a>
                        <a id="generateMonthlyReportBtn" class="dropdown-item" href="/MonthlyReport">Monthly Report</a>
                        <a id="generateQuarterlyReportBtn" class="dropdown-item" href="/QuarterlyReport">Quarterly Report</a>
                    </div>
                    </li>

                    <li class="nav-item align-items-end">
                        <a class="nav-link text-light" href="items">Items</a>
                    </li>
                    <li class="nav-item align-items-end">
                        <a class="nav-link text-light" href="aboutus">About Us</a>
                    </li>
                </ul>
            </div>
           

        </nav>
        
        <div class="row justify-content-center" id="Form">
                <h2></h2>
                <form id="salesForm" class="mt-3 justify-content-center "action="generateReceipt" method="post">
                    <div class="form-group d-flex row">
                        <label for="customerName" class="h5 col text-right">Customer Name:</label> 
                        <input type="text" class="form-control bg-dark text-light col-md-6" id="customerName" name="customerName" required>
                    </div>
                    <div class="form-group d-flex row">
                        <label for="itemName" class="h5 col text-right">Product Name:</label> 
                        <select  class="form-control bg-dark text-light col-md-6" id="itemName" name="itemName" required>
                        <option>--Select Product</option>   
                            <% 
                                List<Product> AllProducts = (List<Product>) request.getAttribute("products");
                                if (AllProducts != null) {
                                for (Product product : AllProducts) {
                             %>
                             <option value="<%= product.getProductName() %>"
                                data-unitSelling-price="<%= product.getSellingPrice() %>"
                                data-unitCost-price="<%= product.getCostPrice() %>"
                                >
                                <%= product.getProductName() %>
                             </option>
                             <% 
                                }
                            }
                            %>
                        </select>

                    </div>
                    <div class="form-group d-flex row">
                       
                        <input type="hidden" class="form-control bg-dark col-md-6" id="unitSellingPrice" name="unitSellingPrice" required readonly>
                    </div>
                    <div class="form-group d-flex row">
                        <label for="costPrice" class="h5 col text-right">Quantity:</label>
                        <input type="number" class="form-control  bg-dark text-light col-md-6" id="quantity" name="quantity" min="0" required>
                    </div>
                    <div class="form-group d-flex row">
                        <input type="hidden" class="form-control  bg-dark col-md-6" id="unitCostPrice" name="unitcostPrice" required readonly>
                    </div>
                    <div class="form-group d-flex row">
                        <label for="sellingPrice" class="h5 col text-right">Selling Price:</label>
                        <input type="number" class="form-control bg-dark text-light  col-md-6" id="sellingPrice" name="sellingPrice" required readonly>
                    </div>
                    <div class="form-group d-flex row">
                        <label for="costPrice" class="h5 col text-right">Cost Price:</label>
                        <input type="number" class="form-control  bg-dark text-light  col-md-6" id="costPrice" name="costPrice" required readonly>
                    </div>
                    <div class="form-group d-flex justify-content-center">
                        <button type="submit" class="btn btn-primary">Submit</button>
                    </div>
                    
                </form>
            
        </div>
    </div>
</div>

    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script>
        document.getElementById("itemName").addEventListener("change", function() {
            var selectedProduct = this.options[this.selectedIndex];
            console.log(selectedProduct);
            var unitSellingPriceInput=document.getElementById("unitSellingPrice");
            unitSellingPriceInput.value=selectedProduct.getAttribute("data-unitSelling-price");
            var unitcostPriceInput=document.getElementById("unitCostPrice");
            unitcostPriceInput.value=selectedProduct.getAttribute("data-unitCost-price");
            
        });
        document.getElementById("quantity").addEventListener("change", function() {
            console.log(typeof(parseFloat(this.value)));
            var quantity=parseFloat(this.value);
            var unitSellingPriceInput=document.getElementById("unitSellingPrice").value;
            var unitCostPriceInput=document.getElementById("unitCostPrice").value;
            // var totalSellingPrice=document.getElementById("sellingPrice");
            var totaSellingPrice=(parseFloat(unitSellingPriceInput))*quantity;
          
            document.getElementById("sellingPrice").value=totaSellingPrice;
            var totaSellingPrice=(parseFloat(unitCostPriceInput))*quantity;
            
            document.getElementById("costPrice").value=totaSellingPrice;
            

        
        });
   
    </script>
</body>
</html>
