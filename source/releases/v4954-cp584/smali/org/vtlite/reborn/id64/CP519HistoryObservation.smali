.class public final Lorg/vtlite/reborn/id64/CP519HistoryObservation;
.super Ljava/lang/Object;


# direct methods
.method static classify(Ljava/lang/String;I)I
    .registers 7

    const/4 v0, 0x0

    if-lez p1, :cond_2c

    const v1, 0x77359400

    if-ge p1, v1, :cond_2c

    const/4 v0, 0x4

    if-eqz p0, :cond_2c

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    if-lez v1, :cond_2c

    const v2, 0x80000

    if-gt v1, v2, :cond_2c

    :try_start_16
    new-instance v1, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    sget-object v2, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->USER:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    int-to-long v3, p1

    const/4 v0, 0x0

    invoke-direct {v1, v2, v3, v4, v0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;-><init>(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;JLorg/vtlite/reborn/id64/LosslessResponseShadow$1;)V

    invoke-static {p0, v1}, Lorg/vtlite/reborn/id64/Id64HistoryProbe;->cp484FirstPage(Ljava/lang/String;Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;)Lorg/vtlite/reborn/id64/CP484HistoryResult;

    move-result-object v1

    iget v0, v1, Lorg/vtlite/reborn/id64/CP484HistoryResult;->status:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2c

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2c

    const/4 v0, 0x3
    :try_end_2c
    .catch Ljava/lang/RuntimeException; {:try_start_16 .. :try_end_2c} :catch_2d
    .catch Ljava/lang/LinkageError; {:try_start_16 .. :try_end_2c} :catch_2d

    :cond_2c
    return v0

    :catch_2d
    move-exception v1

    const/4 v0, 0x5

    return v0
.end method

.method public static observe(Ljava/lang/String;I)V
    .registers 4

    :try_start_0
    invoke-static {}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->cp520DiagnosticsEnabled()Z

    move-result v0

    if-eqz v0, :cond_2f

    invoke-static {p0, p1}, Lorg/vtlite/reborn/id64/CP519HistoryObservation;->classify(Ljava/lang/String;I)I

    move-result v0

    const-string v1, "HISTORY_SHADOW_SCOPE_SKIPPED"

    if-eqz v0, :cond_24

    const/4 p0, 0x1

    const-string v1, "HISTORY_SHADOW_ACCEPTED"

    if-eq v0, p0, :cond_24

    const/4 p0, 0x2

    const-string v1, "HISTORY_SHADOW_EMPTY"

    if-eq v0, p0, :cond_24

    const/4 p0, 0x3

    const-string v1, "HISTORY_SHADOW_NOT_ADMITTED"

    if-eq v0, p0, :cond_24

    const/4 p0, 0x4

    const-string v1, "HISTORY_SHADOW_SIZE_SKIPPED"

    if-eq v0, p0, :cond_24

    const-string v1, "HISTORY_SHADOW_INTERNAL_FAILURE"

    :cond_24
    invoke-static {}, Lorg/vtlite/reborn/captcha/RebornCaptchaHostQa;->cp520DiagnosticsEnabled()Z

    move-result v0

    if-eqz v0, :cond_2f

    const-string v0, "RebornCP519"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2f
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_2f} :catch_30
    .catch Ljava/lang/LinkageError; {:try_start_0 .. :try_end_2f} :catch_30

    :cond_2f
    return-void

    :catch_30
    move-exception v0

    return-void
.end method
