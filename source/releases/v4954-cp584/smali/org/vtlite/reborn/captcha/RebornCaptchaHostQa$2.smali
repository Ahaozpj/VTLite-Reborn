.class Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa$2;
.super Ljava/lang/Object;
.source "RebornCaptchaHostQa.java"

# interfaces
.implements Landroid/content/SharedPreferences$OnSharedPreferenceChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 59
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onSharedPreferenceChanged(Landroid/content/SharedPreferences;Ljava/lang/String;)V
    .registers 4
    .param p1, "prefs"    # Landroid/content/SharedPreferences;
    .param p2, "key"    # Ljava/lang/String;

    .line 61
    const-string v0, "__dbg_api_errors"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    # invokes: Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->refresh()V
    invoke-static {}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->access$000()V

    .line 62
    :cond_b
    return-void
.end method
