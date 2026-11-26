.class public final Lcp130/AuthFailureLabel;
.super Ljava/lang/Object;


# direct methods
.method public static format(Lcom/vk/auth/api/models/AuthAnswer;Ljava/lang/String;)Ljava/lang/String;
    .registers 8

    const-string v0, "OTHER"

    const-string v1, "OTHER"

    if-eqz p0, :cond_c7

    invoke-virtual {p0}, Lcom/vk/auth/api/models/AuthAnswer;->d()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Lcom/vk/auth/api/models/AuthAnswer;->f()Ljava/lang/String;

    move-result-object v3

    if-eqz v2, :cond_1b

    const-string v4, "invalid_client"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1b

    const-string v0, "INVALID_CLIENT"

    goto :goto_5c

    :cond_1b
    if-eqz v2, :cond_28

    const-string v4, "invalid_grant"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_28

    const-string v0, "INVALID_GRANT"

    goto :goto_5c

    :cond_28
    if-eqz v2, :cond_35

    const-string v4, "invalid_request"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_35

    const-string v0, "INVALID_REQUEST"

    goto :goto_5c

    :cond_35
    if-eqz v2, :cond_42

    const-string v4, "need_authcheck"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_42

    const-string v0, "NEED_AUTHCHECK"

    goto :goto_5c

    :cond_42
    if-eqz v2, :cond_4f

    const-string v4, "need_validation"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_4f

    const-string v0, "NEED_VALIDATION"

    goto :goto_5c

    :cond_4f
    if-eqz v2, :cond_5c

    const-string v4, "access_denied"

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_5c

    const-string v0, "ACCESS_DENIED"

    goto :goto_5c

    :cond_5c
    :goto_5c
    if-eqz v3, :cond_69

    const-string v4, "username_or_password_is_incorrect"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_69

    const-string v1, "BAD_CREDENTIALS"

    goto :goto_c7

    :cond_69
    if-eqz v3, :cond_79

    const-string v4, "password_bruteforce_attempt"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_79

    const-string v1, "BRUTEFORCE_LOCK"

    invoke-static {}, Lorg/vtlite/reborn/authtrace/RebornAuthDiag;->bruteforceSeen()V

    goto :goto_c7

    :cond_79
    if-eqz v3, :cond_86

    const-string v4, "too_much_tries"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_86

    const-string v1, "TOO_MANY_TRIES"

    goto :goto_c7

    :cond_86
    if-eqz v3, :cond_93

    const-string v4, "wrong_otp"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_93

    const-string v1, "WRONG_OTP"

    goto :goto_c7

    :cond_93
    if-eqz v3, :cond_a0

    const-string v4, "otp_format_is_incorrect"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_a0

    const-string v1, "BAD_OTP_FORMAT"

    goto :goto_c7

    :cond_a0
    if-eqz v3, :cond_ad

    const-string v4, "invalid_client"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ad

    const-string v1, "INVALID_CLIENT"

    goto :goto_c7

    :cond_ad
    if-eqz v3, :cond_ba

    const-string v4, "need_authcheck"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_ba

    const-string v1, "NEED_AUTHCHECK"

    goto :goto_c7

    :cond_ba
    if-eqz v3, :cond_c7

    const-string v4, "captcha_needed"

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_c7

    const-string v1, "CAPTCHA_NEEDED"

    goto :goto_c7

    :cond_c7
    :goto_c7
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "CP130 AUTH  E="

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "  T="

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\n"

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-eqz p1, :cond_e6

    invoke-virtual {v5, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_e6
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    return-object v4
.end method
