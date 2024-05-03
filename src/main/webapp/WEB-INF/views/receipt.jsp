<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="store.management.model.*" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
        top: 45%;
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
        <div class="d-flex justify-content-center">
        <div class="col-md-6 justify-content-center">
            <h1 class="text-center " id="logo">Receipt</h1>

        <div class="d-flex justify-content-between">
            <h3>Customer Name : ${receipt.getCustomerName() }</h3>
            
        </div>
            <table class="table table-light table-striped table-bordered border border-dark">
                <tr>
                    <td>Item Name</td>
                    <td>Quantity</td>
                    <td>Unit price</td>
                    <td>Total price</td> 
                </tr>
               
                    <tr>
                        <td>${receipt.getItemName() }</td>
                        <td>${receipt.getQuantity() }</td>
                        <td>${receipt.getSellingPrice() / receipt.getQuantity()}</td>
                        <td>${receipt.getSellingPrice() }</td>
                    </tr>
                    
                
            </table>
                <div>
                    <button class="btn btn-secondary" onclick="history.back()">Back</button>
                    <!-- <a href="" class="btn btn-secondary">Print</a> -->
                    <button class="btn btn-secondary" onclick="printReceipt()">Print</button>

                </div>
            </div>
        </div>
        <script>
            function printReceipt() {
                window.print();
            }
        </script>
    </body>
</html>