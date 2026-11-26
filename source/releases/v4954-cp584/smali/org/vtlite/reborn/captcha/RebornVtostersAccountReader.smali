.class public final Lorg/vtlite/reborn/captcha/RebornVtostersAccountReader;
.super Ljava/lang/Object;
.source "RebornVtostersAccountReader.java"

# interfaces
.implements Lorg/vtlite/reborn/captcha/RebornSessionEpoch$AccountReader;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public currentAccount()Ljava/lang/Object;
    .registers 3

    .line 16
    invoke-static {}, Lcom/vtosters/lite/auth/VKAccountManager;->d()Lcom/vk/auth/api/VKAccount;

    move-result-object v0

    .line 17
    .local v0, "account":Lcom/vk/auth/api/VKAccount;
    if-eqz v0, :cond_e

    invoke-virtual {v0}, Lcom/vk/auth/api/VKAccount;->b1()Z

    move-result v1

    if-eqz v1, :cond_e

    move-object v1, v0

    goto :goto_f

    :cond_e
    const/4 v1, 0x0

    :goto_f
    return-object v1
.end method
