<#import "template.ftl" as layout>
    <@layout.registrationLayout displayInfo=true; section>
        <#if section="header">
            ${msg("updatePasswordTitle")}
            <#elseif section="form">
                <form id="kc-passwd-update-form" class="${properties.kcFormClass!}" action="${url.loginAction}" method="post">
                    <div class="login-card">
                        <div class="Logo">
                            <img src="${url.resourcesPath}/img/BEWOTEC_Logo.png" alt="Logo" />
                        </div>
                        <h2>
                            ${msg("updatePasswordTitle")}
                        </h2>
                        <div class="login-card-content">
                            ${msg("updatePasswordInstruction")}
                        </div>
                        <div class="input-group">
                            <label for="password-new">
                                ${msg("passwordNew")}
                            </label>
                            <span class="input-icon">
                                <img src="${url.resourcesPath}/img/password.svg" alt="Password Icon" />
                            </span>
                            <input
                                type="password"
                                id="password-new"
                                name="password-new"
                                class="${properties.kcInputClass!}"
                                autofocus
                                autocomplete="off"
                                aria-invalid="<#if messagesPerField.existsError('password','password-confirm')>true</#if>" />
                            <button type="button" id="togglePassword" class="toggle-password" style="top: 66%;">
                                <i id="toggleIcon" class="fa fa-eye"></i>
                            </button>
                            <#if messagesPerField.existsError('password')>
                                <span id="input-error-password" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('password'))?no_esc}
                                </span>
                            </#if>
                        </div>
                        <div class="input-group">
                            <label for="password-confirm">
                                ${msg("passwordConfirm")}
                            </label>
                            <span class="input-icon">
                                <img src="${url.resourcesPath}/img/password.svg" alt="Password Icon" />
                            </span>
                            <input
                                type="password"
                                id="password-confirm"
                                name="password-confirm"
                                class="${properties.kcInputClass!}"
                                autocomplete="off"
                                aria-invalid="<#if messagesPerField.existsError('password-confirm')>true</#if>" />
                            <#if messagesPerField.existsError('password-confirm')>
                                <span id="input-error-password-confirm" class="${properties.kcInputErrorMessageClass!}" aria-live="polite">
                                    ${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}
                                </span>
                            </#if>
                        </div>
                        <button class="primary-button" type="submit">
                            ${msg("doSubmit")}
                        </button>
                    </div>
                </form>
                <#elseif section="info">
                    <#-- ${msg("updatePasswordInfoMessage")} -->
        </#if>
        <script>
        const togglePassword = document.querySelector('#togglePassword');
        const password = document.querySelector('#password-new');
        const toggleIcon = document.querySelector('#toggleIcon');
        togglePassword.addEventListener('click', function() {
            // Toggle the type attribute
            const type = password.getAttribute('type') === 'password' ? 'text' : 'password';
            password.setAttribute('type', type);
            // Toggle the eye slash icon
            toggleIcon.classList.toggle('fa-eye-slash');
            toggleIcon.classList.toggle('fa-eye');
        });
        </script>
    </@layout.registrationLayout>