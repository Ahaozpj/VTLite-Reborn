.class public final Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;
.super Ljava/lang/Object;
.source "LosslessResponseShadow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/id64/LosslessResponseShadow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Key"
.end annotation


# instance fields
.field public final kind:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

.field public final value:J


# direct methods
.method private constructor <init>(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;J)V
    .registers 6

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    if-eqz p1, :cond_24

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-eqz v0, :cond_24

    const-wide/high16 v0, -0x8000000000000000L

    cmp-long v0, p2, v0

    if-eqz v0, :cond_24

    .line 33
    sget-object v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->USER:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    if-eq p1, v0, :cond_19

    sget-object v0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->MESSAGE:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    if-ne p1, v0, :cond_1f

    :cond_19
    const-wide/16 v0, 0x1

    cmp-long v0, p2, v0

    if-ltz v0, :cond_24

    .line 36
    :cond_1f
    iput-object p1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->kind:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    iput-wide p2, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->value:J

    return-void

    .line 35
    :cond_24
    const-string p0, "invalid typed identity"

    # invokes: Lorg/vtlite/reborn/id64/LosslessResponseShadow;->fail(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;
    invoke-static {p0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow;->access$000(Ljava/lang/String;)Lorg/vtlite/reborn/id64/LosslessResponseShadow$BoundaryException;

    move-result-object p0

    throw p0
.end method

.method synthetic constructor <init>(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;JLorg/vtlite/reborn/id64/LosslessResponseShadow$1;)V
    .registers 5

    .line 29
    invoke-direct {p0, p1, p2, p3}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;-><init>(Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;J)V

    return-void
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .registers 6

    .line 39
    instance-of v0, p1, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 40
    :cond_6
    check-cast p1, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;

    iget-object v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->kind:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    iget-object v2, p1, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->kind:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    if-ne v0, v2, :cond_17

    iget-wide v2, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->value:J

    iget-wide p0, p1, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->value:J

    cmp-long p0, v2, p0

    if-nez p0, :cond_17

    const/4 v1, 0x1

    :cond_17
    return v1
.end method

.method public hashCode()I
    .registers 6

    .line 43
    iget-object v0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->kind:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    invoke-virtual {v0}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;->ordinal()I

    move-result v0

    mul-int/lit8 v0, v0, 0x1f

    iget-wide v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->value:J

    const/16 p0, 0x20

    ushr-long v3, v1, p0

    xor-long/2addr v1, v3

    long-to-int p0, v1

    add-int/2addr v0, p0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 45
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Key("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;->kind:Lorg/vtlite/reborn/id64/LosslessResponseShadow$Kind;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, ",REDACTED)"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
