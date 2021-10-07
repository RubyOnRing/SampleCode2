$(document).on('click', '#salesforce-new-account .js-submit-new-salesforce-account', function (){
    let accountName = $('#account_name').val()
    let phoneNumber = $('#phone').val()
    let billingStreet = $('#billing_street').val()
    let billingCity = $('#billing_city').val()
    let billingState = $('#billing_state').val()
    let billingPostCode = $('#billing_post_code').val()
    let billingCountry = $('#billing_country').val()

    let accountParams = {
        Name: accountName,
        Phone: phoneNumber,
        BillingStreet: billingStreet,
        BillingCity: billingCity,
        BillingState: billingState,
        BillingPostalCode: billingPostCode,
        BillingCountry: billingCountry
    }

    $.ajax({
        url: '/salesforce/accounts',
        method: 'post',
        format: 'script',
        data: accountParams
    })
})
