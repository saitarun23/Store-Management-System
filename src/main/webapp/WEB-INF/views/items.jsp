<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="store.management.model.*" %>
<head>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
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
                    top: 40%;
                    z-index: 999;
                    right:1%;
                    transform: translate(50,50);
                    width: 340px;
                    background: rgba(255,255,255,0.04);
                    box-shadow: -1px 4px 28px 0px rgba(0,0,0,0.75);
                }
        </style>

    </head>
<body>
    <div class="d-flex justify-content-center">
        <div class="col-md-6 justify-content-center">
            <h1 class="text-center" id="logo">Product Details</h1>
            <table class="table table-light table-striped table-bordered border border-dark">
                <thead>
                    <tr>
                        
                        <th>Name</th>
                        <th>Selling Price</th>
                        <th>Cost Price</th>
                        
                        <!-- Add more headers as needed -->
                    </tr>
                </thead>
                <tbody>
                    <% 
                        List<Product> AllProducts = (List<Product>) request.getAttribute("items");
                        if (AllProducts != null) {
                            for (Product product : AllProducts) {
                    %>
                    <tr>
                        <td><%= product.getProductName() %></td>
                        <td><%= product.getSellingPrice() %></td>
                        <td><%= product.getCostPrice() %></td>
                    </tr>
                    
                    <% 
                        }
                    }
                    %>
                   
                </tbody>
            </table>
            <div>
                <button class="btn btn-secondary" onclick="history.back()">Back</button>
                <button class="btn btn-secondary" onclick="openProductForm()">Add</button>
            </div>

        </div>
    </div>
    <div class="row" id="Form" style="display: none;">
            <form id="salesForm" class="mt-3 justify-content-end "action="addProduct" method="post" onsubmit="Reload()">
                <div class="form-group d-flex row pb-2">
                    <label for="productName" class="h6 col text-end mt-2">Product Name:</label> 
                    <input type="text" class="form-control bg-dark text-light col" id="productName" name="productName" required>
                </div>
                <div class="form-group d-flex row pb-2">
                    <label for="sellingPrice" class="h6 col text-end mt-2">Selling Price:</label> 
                    <input type="text" class="form-control bg-dark text-light col" id="sellingPrice" name="sellingPrice" required>
                </div>
                <div class="form-group d-flex row pb-2">
                    <label for="costPrice" class="h6 col text-end mt-2">Cost Price:</label> 
                    <input type="text" class="form-control bg-dark text-light col" id="costPrice" name="costPrice" required>
                </div>
                <div class="form-group d-flex justify-content-center">
                    <button type="submit" class="btn btn-primary">Submit</button>
                </div>
            </form>
    </div>
</body>
<script>
    function openProductForm(){
        var element=document.getElementById("Form");
        if(element)
        {
            if(element.style.display==='none')
            {
                element.style.display='block';
            }
            else{
                element.style.display='none';
            }
        }
    }
    function Reload(){
        alert("Added Succesfully")
        window.location.reload()
    }
</script>

