.class public final Lcp134/TrustStateDialog;
.super Ljava/lang/Object;
.source "CP134TrustStateDialog.java"


# direct methods
.method public static show(Landroid/content/Context;)V
    .registers 8

    if-eqz p0, :cond_38

    :try_start_2
    const-string v0, "2fa"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    const-string v2, "trusted_hash"

    const/4 v3, 0x0

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1b

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v5

    if-lez v5, :cond_1b

    const-string v5, "CP134 TRUST=PRESENT\nOnly Reborn local state; no secret value shown."

    goto :goto_1d

    :cond_1b
    const-string v5, "CP134 TRUST=ABSENT\nOnly Reborn local state; original VTLite is not inspected."

    :goto_1d
    new-instance v0, Landroid/app/AlertDialog$Builder;

    invoke-direct {v0, p0}, Landroid/app/AlertDialog$Builder;-><init>(Landroid/content/Context;)V

    const-string v2, "CP134 Login diagnostics"

    invoke-virtual {v0, v2}, Landroid/app/AlertDialog$Builder;->setTitle(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/app/AlertDialog$Builder;->setMessage(Ljava/lang/CharSequence;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    const-string v2, "OK"

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/app/AlertDialog$Builder;->setPositiveButton(Ljava/lang/CharSequence;Landroid/content/DialogInterface$OnClickListener;)Landroid/app/AlertDialog$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/AlertDialog$Builder;->show()Landroid/app/AlertDialog;
    :try_end_36
    .catch Ljava/lang/Throwable; {:try_start_2 .. :try_end_36} :catch_37

    goto :goto_38

    :catch_37
    move-exception v0

    :cond_38
    :goto_38
    return-void
.end method
