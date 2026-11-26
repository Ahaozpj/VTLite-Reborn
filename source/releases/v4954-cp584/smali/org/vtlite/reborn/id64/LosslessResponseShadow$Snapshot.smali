.class public final Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;
.super Ljava/lang/Object;
.source "LosslessResponseShadow.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/vtlite/reborn/id64/LosslessResponseShadow;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Snapshot"
.end annotation


# instance fields
.field public final groups:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;",
            ">;"
        }
    .end annotation
.end field

.field public final hasLegacyInvalidProfile:Z

.field public final hasUnresolvedPeer:Z

.field public final hasWideMessage:Z

.field public final hasWidePeer:Z

.field public final hasWideProfile:Z

.field public final items:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;",
            ">;"
        }
    .end annotation
.end field

.field private final original:Ljava/lang/String;

.field public final profiles:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;ZZZZZ)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;",
            ">;",
            "Ljava/util/List<",
            "Lorg/vtlite/reborn/id64/LosslessResponseShadow$Key;",
            ">;",
            "Ljava/util/List<",
            "Lorg/vtlite/reborn/id64/LosslessResponseShadow$Item;",
            ">;ZZZZZ)V"
        }
    .end annotation

    .line 68
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 69
    iput-object p1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->original:Ljava/lang/String;

    .line 70
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->profiles:Ljava/util/List;

    .line 71
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p3}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->groups:Ljava/util/List;

    .line 72
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p4}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->items:Ljava/util/List;

    .line 73
    iput-boolean p5, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->hasWideProfile:Z

    iput-boolean p6, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->hasLegacyInvalidProfile:Z

    .line 74
    iput-boolean p7, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->hasWidePeer:Z

    iput-boolean p8, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->hasWideMessage:Z

    iput-boolean p9, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->hasUnresolvedPeer:Z

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;ZZZZZLorg/vtlite/reborn/id64/LosslessResponseShadow$1;)V
    .registers 11

    .line 60
    invoke-direct/range {p0 .. p9}, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;-><init>(Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;ZZZZZ)V

    return-void
.end method


# virtual methods
.method public canDisplay()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public canNavigate()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public canUseLegacyParser()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public canWriteLegacyStorage()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public canWriteV2Storage()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public originalStringIdenticalTo(Ljava/lang/String;)Z
    .registers 2

    .line 76
    iget-object p0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->original:Ljava/lang/String;

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 83
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "CP346 shadow profiles="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->profiles:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " groups="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->groups:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " items="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lorg/vtlite/reborn/id64/LosslessResponseShadow$Snapshot;->items:Ljava/util/List;

    .line 84
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p0, " display=false writes=false"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
