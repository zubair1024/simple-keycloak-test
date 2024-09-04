<#import "template.ftl" as layout>
    <@layout.registrationLayout displayInfo=true; section>
        <#if section="header">
            ${msg("emailVerificationTitle")}
            <#elseif section="form">
                <div class="login-card">
                    <div class="Logo">
                        <img src="${url.resourcesPath}/img/BEWOTEC_Logo.png" alt="Logo" />
                    </div>
                    <h2>
                        ${msg("emailVerificationTitle")}
                    </h2>
                    <#-- <div class="login-card-content">
                        <p>
                            ${msg("emailVerificationInstruction", email)}
                        </p>
                </div> -->
                <div class="email-icon">
                    <i class="fa fa-envelope fa-5x" aria-hidden="true"></i>
                </div>
                <div class="resend-email">
                    <p>
                        ${msg("emailVerificationResend")}
                    </p>
                    <a href="${url.loginAction}" class="resend-link">
                        ${msg("doResendEmail")}
                    </a>
                </div>
                <a href="${url.loginUrl}">
                    <button class="primary-button">
                        ${msg("backToLogin")}
                    </button>
                </a>
                </div>
                <#elseif section="info">
                    <#-- ${msg("emailVerificationAdditionalInfo")} -->
        </#if>
    </@layout.registrationLayout>