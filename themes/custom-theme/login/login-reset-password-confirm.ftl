<#import "template.ftl" as layout>
    <@layout.registrationLayout displayInfo=true; section>
        <#if section="header">
            ${msg("emailSentTitle")}
            <#elseif section="form">
                <div class="login-card">
                    <div class="Logo">
                        <img src="${url.resourcesPath}/img/BEWOTEC_Logo.png" alt="Logo" />
                    </div>
                    <h2>
                        ${msg("emailSentTitle")}
                    </h2>
                    <div class="login-card-content">
                        <p>
                            ${msg("emailSentDescription")}
                        </p>
                    </div>
                    <div class="confirmation-icon">
                        <img src="${url.resourcesPath}/img/email_sent.svg" alt="Email Sent Icon" />
                    </div>
                    <div class="additional-info">
                        <p>
                            ${msg("emailSentAdditionalInfo")}
                        </p>
                    </div>
                    <a href="${url.loginUrl}" class="primary-button">
                        ${msg("backToLogin")}
                    </a>
                </div>
                <#elseif section="info">
                    <#-- ${msg("emailSentInfo")} -->
        </#if>
    </@layout.registrationLayout>