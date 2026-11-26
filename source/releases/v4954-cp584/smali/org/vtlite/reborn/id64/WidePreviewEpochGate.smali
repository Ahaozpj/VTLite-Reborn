.class public final Lorg/vtlite/reborn/id64/WidePreviewEpochGate;
.super Ljava/lang/Object;
.source "WidePreviewEpochGate.java"


# instance fields
.field private attached:Z

.field private epoch:J

.field private exhausted:Z

.field private opted:Z

.field private session:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private advance()V
    .registers 6

    iget-boolean v4, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->exhausted:Z

    if-nez v4, :cond_20

    iget-wide v0, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->epoch:J

    const-wide v2, 0x7fffffffffffffffL

    cmp-long v4, v0, v2

    if-eqz v4, :cond_16

    const-wide/16 v2, 0x1

    add-long v0, v0, v2

    iput-wide v0, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->epoch:J

    return-void

    :cond_16
    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->epoch:J

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->attached:Z

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->exhausted:Z

    :cond_20
    return-void
.end method

.method public static enabledForProduction()Z
    .registers 1

    const/4 v0, 0x0

    return v0
.end method

.method private static mainThread()Z
    .registers 2

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v0

    if-eqz v0, :cond_e

    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_e

    const/4 v0, 0x1

    return v0

    :cond_e
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public accept(Ljava/lang/Object;J)Z
    .registers 7

    if-eqz p1, :cond_19

    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->attached:Z

    if-eqz v0, :cond_19

    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->opted:Z

    if-eqz v0, :cond_19

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->session:Ljava/lang/Object;

    if-ne v0, p1, :cond_19

    iget-wide v1, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->epoch:J

    cmp-long v0, v1, p2

    if-nez v0, :cond_19

    invoke-static {}, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->mainThread()Z

    move-result v0

    return v0

    :cond_19
    const/4 v0, 0x0

    return v0
.end method

.method public currentEpoch()J
    .registers 4

    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->attached:Z

    if-eqz v0, :cond_d

    invoke-static {}, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->mainThread()Z

    move-result v0

    if-eqz v0, :cond_d

    iget-wide v0, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->epoch:J

    return-wide v0

    :cond_d
    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method public enterView()V
    .registers 5

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->leaveView()V

    invoke-static {}, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->mainThread()Z

    move-result v0

    if-eqz v0, :cond_18

    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->exhausted:Z

    if-nez v0, :cond_18

    iget-wide v2, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->epoch:J

    const-wide/16 v0, 0x0

    cmp-long v0, v2, v0

    if-eqz v0, :cond_18

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->attached:Z

    :cond_18
    return-void
.end method

.method public invalidate()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->session:Ljava/lang/Object;

    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->opted:Z

    invoke-direct {p0}, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->advance()V

    return-void
.end method

.method public leaveView()V
    .registers 2

    invoke-virtual {p0}, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->invalidate()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->attached:Z

    return-void
.end method

.method public stage(Ljava/lang/Object;JZ)Z
    .registers 9

    if-eqz p4, :cond_28

    if-eqz p1, :cond_28

    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->attached:Z

    if-eqz v0, :cond_28

    invoke-static {}, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->mainThread()Z

    move-result v0

    if-eqz v0, :cond_28

    iget-wide v2, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->epoch:J

    const-wide/16 v0, 0x0

    cmp-long v0, v2, v0

    if-eqz v0, :cond_28

    cmp-long v0, v2, p2

    if-nez v0, :cond_28

    iget-boolean v0, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->opted:Z

    if-eqz v0, :cond_22

    iget-object v0, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->session:Ljava/lang/Object;

    if-ne v0, p1, :cond_28

    :cond_22
    iput-object p1, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->session:Ljava/lang/Object;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lorg/vtlite/reborn/id64/WidePreviewEpochGate;->opted:Z

    return v0

    :cond_28
    const/4 v0, 0x0

    return v0
.end method
