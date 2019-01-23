# IOS-Maento-App
IOS Project for Magento 
# (1) integrationAdminTokenServiceV1

Details: Create access token for admin given the admin credentials.

Parrameters:
{
  "username": "string",
  "password": "string"
}

# (2) integrationCustomerTokenServiceV1

Details: Create access token for admin given the customer credentials.

Parrameters:
{
  "username": "string",
  "password": "string"
}

# (3) customerAccountManagementV1

POST: Create customer account. Perform necessary business operations like sending email.

Parrameters:
{
  "customer": {
    "email": "string",
    "firstname": "string",
    "lastname": "string",
    "addresses": [
      {
        "id": 0,
        "customer_id": 0,
        "region": {
          "region_code": "string",
          "region": "string",
          "region_id": 0,
          "extension_attributes": {}
        },
        "region_id": 0,
        "country_id": "string",
        "street": [
          "string"
        ],
        "postcode": "string",
        "city": "string",
    },
  },
  "password": "string",
  "redirectUrl": "string"
}

GET: Check if password reset token is valid.

{
"customerId"
"resetPasswordLinkToken"
}

PUT: Send an email to the customer with a password reset link.

{
  "email": "string",
  "template": "string",
  "websiteId": 0
}

POST: Check if given email is associated with a customer account in given website.
{
  "customerEmail": "string",
  "websiteId": 0
}

# (4) catalogProductRenderListV1

Request URL
http://www.HOSTNAME.com/rest/all/V1/products-render-info?searchCriteria[filterGroups]%5B%5D%5Bfilters%5D%5B%5D%5Bfield%5D=category_Id%26&searchCriteria[filterGroups]%5B%5D%5Bfilters%5D%5B%5D%5Bvalue%5D=3&searchCriteria[filterGroups]%5B%5D%5Bfilters%5D%5B%5D%5BconditionType%5D=from%26&storeId=1&currencyCode=Dollar


# (5) directoryCountryInformationAcquirerV1

GET /V1/directory/countries
Get all countries and regions information for the store.
Parameter { countryId } 

GET /V1/directory/countries/{countryId}
Get country and region information for the store.
Parameter { countryId } 

# (6) directoryCurrencyInformationAcquirerV1
Get currency information for the store.

# (7) checkoutGuestShippingInformationManagementV1
POST /V1/guest-carts/{cartId}/shipping-information

# (8) checkoutGuestShippingInformationManagementV1
POST /V1/guest-carts/{cartId}/shipping-information

# (9) quoteGuestBillingAddressManagementV1
GET /V1/guest-carts/{cartId}/billing-address
POST /V1/guest-carts/{cartId}/billing-address

# (10) quoteGuestCartItemRepositoryV1
GET /V1/guest-carts/{cartId}/items
POST /V1/guest-carts/{cartId}/items
DELETE /V1/guest-carts/{cartId}/items/{itemId}
PUT /V1/guest-carts/{cartId}/items/{itemId}

# (11) quoteGuestCartManagementV1
POST /V1/guest-carts
PUT /V1/guest-carts/{cartId}/order

# (12) quoteGuestBillingAddressManagementV1
GET /V1/guest-carts/{cartId}/billing-address
POST /V1/guest-carts/{cartId}/billing-address

# (13) quoteGuestCartItemRepositoryV1
GET /V1/guest-carts/{cartId}/items
POST /V1/guest-carts/{cartId}/items
DELETE /V1/guest-carts/{cartId}/items/{itemId}
PUT /V1/guest-carts/{cartId}/items/{itemId}

# (14) quoteGuestCartManagementV1
POST /V1/guest-carts
PUT /V1/guest-carts/{cartId}/order

# (15) quoteGuestCartRepositoryV1
GET /V1/guest-carts/{cartId}

# (16) quoteGuestCartTotalManagementV1
PUT /V1/guest-carts/{cartId}/collect-totals

# (17) quoteGuestCartTotalRepositoryV1
GET /V1/guest-carts/{cartId}/totals

# (18) quoteGuestCouponManagementV1
DELETE /V1/guest-carts/{cartId}/coupons
GET /V1/guest-carts/{cartId}/coupons
PUT /V1/guest-carts/{cartId}/coupons/{couponCode}

# (19) quoteGuestPaymentMethodManagementV1
POST /V1/guest-carts/{cartId}/estimate-shipping-methods

# (20) quoteGuestShipmentEstimationV1
POST /V1/guest-carts/{cartId}/estimate-shipping-methods
