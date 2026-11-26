.class public final Lcp140/AuthSummary;
.super Ljava/lang/Object;
.source "CP140AuthSummary.java"


# direct methods
.method public static format(Lcom/vk/auth/api/models/AuthAnswer;Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    invoke-static {p0, p1}, Lcp136/AuthSummary;->format(Lcom/vk/auth/api/models/AuthAnswer;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {}, Lcp140/OAuthShape;->summary()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\n"

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {}, Lorg/vtlite/reborn/authtrace/RebornAuthDiag;->summary()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
