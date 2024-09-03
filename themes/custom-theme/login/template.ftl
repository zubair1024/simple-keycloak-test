<#macro registrationLayout bodyClass="" displayInfo=false displayMessage=true displayRequiredFields=false>
    <!DOCTYPE html>
    <html>

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>
            ${msg("loginTitle",(realm.displayName!''))}
        </title>
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link rel="preconnect" href="https://fonts.googleapis.com" />
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
        <link
            href="https://fonts.googleapis.com/css2?family=Archivo:ital,wght@0,100..900;1,100..900&display=swap"
            rel="stylesheet" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <#if properties.styles?has_content>
            <#list properties.styles?split(' ') as style>
            <link href="${url.resourcesPath}/${style}" rel="stylesheet" />
        </#list>
    </#if>
</head>
<body>
    <#--  <#nested "header">  -->
    <#--  <#if displayMessage && message?has_content && (message.type != ' warning' || !isAppInitiatedAction??)>
                <div class="alert alert-${message.type}">
                    <#if message.type='success'><span class="${properties.kcFeedbackSuccessIcon!}"></span></#if>
                    <#if message.type='warning'><span class="${properties.kcFeedbackWarningIcon!}"></span></#if>
                    <#if message.type='error'><span class="${properties.kcFeedbackErrorIcon!}"></span></#if>
                    <#if message.type='info'><span class="${properties.kcFeedbackInfoIcon!}"></span></#if>
                    <span class="message-text">
                        ${kcSanitize(message.summary)?no_esc}
                    </span>
                </div>
        </#if> -->
        <#nested "form">
            <#if displayInfo>
                <#nested "info">
            </#if>
            </body>

    </html>
</#macro>