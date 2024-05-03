<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
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
    <div class="container">
        <h1 class="text-center" id="logo">About Us</h1>
        <p>
            By Store management, the process for increasing sales, brand awareness, and customer satisfaction by means
            of improving communication with customers and services provided is meant. The “system” addition outlines the
            automation of these processes, representing the general trend in retail and other industries.
        </p>
        <p>
            Inventory management is vital to a company’s health because it helps make sure there is rarely too much or too little
            stock on hand, limiting the risk of stockouts and inaccurate records.
            Public companies must track inventory as a requirement for compliance with Securities and Exchange Commission (SEC) rules
            and the Sarbanes-Oxley (SOX) Act. Companies must document their management processes to prove compliance.
        </p>
        <!-- Add more content as needed -->
    </div>
    <div> 
        <button class="btn btn-secondary" onclick="history.back()">Back</button>
    </div>
</body>
</html>
