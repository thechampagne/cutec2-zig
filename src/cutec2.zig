pub const C2_MAX_POLYGON_VERTS = @as(c_int, 8);
pub const c2v = extern struct {
    x: f32,
    y: f32,
};

pub const c2r = extern struct {
    c: f32,
    s: f32,
};

pub const c2m = extern struct {
    x: c2v,
    y: c2v,
};

pub const c2x = extern struct {
    p: c2v,
    r: c2r,
};

pub const c2h = extern struct {
    n: c2v,
    d: f32,
};

pub const c2Circle = extern struct {
    p: c2v,
    r: f32,
};

pub const c2AABB = extern struct {
    min: c2v,
    max: c2v,
};

pub const c2Capsule = extern struct {
    a: c2v,
    b: c2v,
    r: f32,
};

pub const c2Poly = extern struct {
    count: c_int,
    verts: [8]c2v,
    norms: [8]c2v,
};

pub const c2Ray = extern struct {
    p: c2v,
    d: c2v,
    t: f32,
};

pub const c2Raycast = extern struct {
    t: f32,
    n: c2v,
};

pub const c2Manifold = extern struct {
    count: c_int,
    depths: [2]f32,
    contact_points: [2]c2v,
    n: c2v,
};

pub extern "C" fn c2CircletoCircle(A: c2Circle, B: c2Circle) c_int;
pub extern "C" fn c2CircletoAABB(A: c2Circle, B: c2AABB) c_int;
pub extern "C" fn c2CircletoCapsule(A: c2Circle, B: c2Capsule) c_int;
pub extern "C" fn c2AABBtoAABB(A: c2AABB, B: c2AABB) c_int;
pub extern "C" fn c2AABBtoCapsule(A: c2AABB, B: c2Capsule) c_int;
pub extern "C" fn c2CapsuletoCapsule(A: c2Capsule, B: c2Capsule) c_int;
pub extern "C" fn c2CircletoPoly(A: c2Circle, B: [*c]const c2Poly, bx: [*c]const c2x) c_int;
pub extern "C" fn c2AABBtoPoly(A: c2AABB, B: [*c]const c2Poly, bx: [*c]const c2x) c_int;
pub extern "C" fn c2CapsuletoPoly(A: c2Capsule, B: [*c]const c2Poly, bx: [*c]const c2x) c_int;
pub extern "C" fn c2PolytoPoly(A: [*c]const c2Poly, ax: [*c]const c2x, B: [*c]const c2Poly, bx: [*c]const c2x) c_int;
pub extern "C" fn c2RaytoCircle(A: c2Ray, B: c2Circle, out: [*c]c2Raycast) c_int;
pub extern "C" fn c2RaytoAABB(A: c2Ray, B: c2AABB, out: [*c]c2Raycast) c_int;
pub extern "C" fn c2RaytoCapsule(A: c2Ray, B: c2Capsule, out: [*c]c2Raycast) c_int;
pub extern "C" fn c2RaytoPoly(A: c2Ray, B: [*c]const c2Poly, bx_ptr: [*c]const c2x, out: [*c]c2Raycast) c_int;
pub extern "C" fn c2CircletoCircleManifold(A: c2Circle, B: c2Circle, m: [*c]c2Manifold) void;
pub extern "C" fn c2CircletoAABBManifold(A: c2Circle, B: c2AABB, m: [*c]c2Manifold) void;
pub extern "C" fn c2CircletoCapsuleManifold(A: c2Circle, B: c2Capsule, m: [*c]c2Manifold) void;
pub extern "C" fn c2AABBtoAABBManifold(A: c2AABB, B: c2AABB, m: [*c]c2Manifold) void;
pub extern "C" fn c2AABBtoCapsuleManifold(A: c2AABB, B: c2Capsule, m: [*c]c2Manifold) void;
pub extern "C" fn c2CapsuletoCapsuleManifold(A: c2Capsule, B: c2Capsule, m: [*c]c2Manifold) void;
pub extern "C" fn c2CircletoPolyManifold(A: c2Circle, B: [*c]const c2Poly, bx: [*c]const c2x, m: [*c]c2Manifold) void;
pub extern "C" fn c2AABBtoPolyManifold(A: c2AABB, B: [*c]const c2Poly, bx: [*c]const c2x, m: [*c]c2Manifold) void;
pub extern "C" fn c2CapsuletoPolyManifold(A: c2Capsule, B: [*c]const c2Poly, bx: [*c]const c2x, m: [*c]c2Manifold) void;
pub extern "C" fn c2PolytoPolyManifold(A: [*c]const c2Poly, ax: [*c]const c2x, B: [*c]const c2Poly, bx: [*c]const c2x, m: [*c]c2Manifold) void;
pub const C2_TYPE = enum(c_uint) {
    CIRCLE = 0,
    AABB = 1,
    CAPSULE = 2,
    POLY = 3
};
pub const c2GJKCache = extern struct {
    metric: f32,
    count: c_int,
    iA: [3]c_int,
    iB: [3]c_int,
    div: f32,
};

pub extern "C" fn c2GJK(A: ?*const anyopaque, typeA: C2_TYPE, ax_ptr: [*c]const c2x, B: ?*const anyopaque, typeB: C2_TYPE, bx_ptr: [*c]const c2x, outA: [*c]c2v, outB: [*c]c2v, use_radius: c_int, iterations: [*c]c_int, cache: [*c]c2GJKCache) f32;
pub const c2TOIResult = extern struct {
    hit: c_int,
    toi: f32,
    n: c2v,
    p: c2v,
    iterations: c_int,
};

pub extern "C" fn c2TOI(A: ?*const anyopaque, typeA: C2_TYPE, ax_ptr: [*c]const c2x, vA: c2v, B: ?*const anyopaque, typeB: C2_TYPE, bx_ptr: [*c]const c2x, vB: c2v, use_radius: c_int) c2TOIResult;
pub extern "C" fn c2Inflate(shape: ?*anyopaque, @"type": C2_TYPE, skin_factor: f32) void;
pub extern "C" fn c2Hull(verts: [*c]c2v, count: c_int) c_int;
pub extern "C" fn c2Norms(verts: [*c]c2v, norms: [*c]c2v, count: c_int) void;
pub extern "C" fn c2MakePoly(p: [*c]c2Poly) void;
pub extern "C" fn c2Collided(A: ?*const anyopaque, ax: [*c]const c2x, typeA: C2_TYPE, B: ?*const anyopaque, bx: [*c]const c2x, typeB: C2_TYPE) c_int;
pub extern "C" fn c2Collide(A: ?*const anyopaque, ax: [*c]const c2x, typeA: C2_TYPE, B: ?*const anyopaque, bx: [*c]const c2x, typeB: C2_TYPE, m: [*c]c2Manifold) void;
pub extern "C" fn c2CastRay(A: c2Ray, B: ?*const anyopaque, bx: [*c]const c2x, typeB: C2_TYPE, out: [*c]c2Raycast) c_int;

pub inline fn c2SinCos(arg_radians: f32, arg_s: [*c]f32, arg_c: [*c]f32) void {
    var radians = arg_radians;
    var s = arg_s;
    var c = arg_c;
    c.* = @cos(radians);
    s.* = @sin(radians);
}
pub inline fn c2V(arg_x: f32, arg_y: f32) c2v {
    var x = arg_x;
    var y = arg_y;
    var a: c2v = undefined;
    a.x = x;
    a.y = y;
    return a;
}
pub inline fn c2Add(arg_a: c2v, arg_b: c2v) c2v {
    var a = arg_a;
    var b = arg_b;
    a.x += b.x;
    a.y += b.y;
    return a;
}
pub inline fn c2Sub(arg_a: c2v, arg_b: c2v) c2v {
    var a = arg_a;
    var b = arg_b;
    a.x -= b.x;
    a.y -= b.y;
    return a;
}
pub inline fn c2Dot(arg_a: c2v, arg_b: c2v) f32 {
    var a = arg_a;
    var b = arg_b;
    return (a.x * b.x) + (a.y * b.y);
}
pub inline fn c2Mulvs(arg_a: c2v, arg_b: f32) c2v {
    var a = arg_a;
    var b = arg_b;
    a.x *= b;
    a.y *= b;
    return a;
}
pub inline fn c2Mulvv(arg_a: c2v, arg_b: c2v) c2v {
    var a = arg_a;
    var b = arg_b;
    a.x *= b.x;
    a.y *= b.y;
    return a;
}
pub inline fn c2Div(arg_a: c2v, arg_b: f32) c2v {
    var a = arg_a;
    var b = arg_b;
    return c2Mulvs(a, 1.0 / b);
}
pub inline fn c2Skew(arg_a: c2v) c2v {
    var a = arg_a;
    var b: c2v = undefined;
    b.x = -a.y;
    b.y = a.x;
    return b;
}
pub inline fn c2CCW90(arg_a: c2v) c2v {
    var a = arg_a;
    var b: c2v = undefined;
    b.x = a.y;
    b.y = -a.x;
    return b;
}
pub inline fn c2Det2(arg_a: c2v, arg_b: c2v) f32 {
    var a = arg_a;
    var b = arg_b;
    return (a.x * b.y) - (a.y * b.x);
}
pub inline fn c2Minv(arg_a: c2v, arg_b: c2v) c2v {
    var a = arg_a;
    var b = arg_b;
    return c2V(if (a.x < b.x) a.x else b.x, if (a.y < b.y) a.y else b.y);
}
pub inline fn c2Maxv(arg_a: c2v, arg_b: c2v) c2v {
    var a = arg_a;
    var b = arg_b;
    return c2V(if (a.x > b.x) a.x else b.x, if (a.y > b.y) a.y else b.y);
}
pub inline fn c2Clampv(arg_a: c2v, arg_lo: c2v, arg_hi: c2v) c2v {
    var a = arg_a;
    var lo = arg_lo;
    var hi = arg_hi;
    return c2Maxv(lo, c2Minv(a, hi));
}
pub inline fn c2Absv(arg_a: c2v) c2v {
    var a = arg_a;
    return c2V(if (a.x < @intToFloat(f32, @as(c_int, 0))) -a.x else a.x, if (a.y < @intToFloat(f32, @as(c_int, 0))) -a.y else a.y);
}
pub inline fn c2Hmin(arg_a: c2v) f32 {
    var a = arg_a;
    return if (a.x < a.y) a.x else a.y;
}
pub inline fn c2Hmax(arg_a: c2v) f32 {
    var a = arg_a;
    return if (a.x > a.y) a.x else a.y;
}
pub inline fn c2Len(arg_a: c2v) f32 {
    var a = arg_a;
    return @sqrt(c2Dot(a, a));
}
pub inline fn c2Norm(arg_a: c2v) c2v {
    var a = arg_a;
    return c2Div(a, c2Len(a));
}
pub inline fn c2SafeNorm(arg_a: c2v) c2v {
    var a = arg_a;
    var sq: f32 = c2Dot(a, a);
    return if (sq != 0) c2Div(a, c2Len(a)) else c2V(@intToFloat(f32, @as(c_int, 0)), @intToFloat(f32, @as(c_int, 0)));
}
pub inline fn c2Neg(arg_a: c2v) c2v {
    var a = arg_a;
    return c2V(-a.x, -a.y);
}
pub inline fn c2Lerp(arg_a: c2v, arg_b: c2v, arg_t: f32) c2v {
    var a = arg_a;
    var b = arg_b;
    var t = arg_t;
    return c2Add(a, c2Mulvs(c2Sub(b, a), t));
}
pub inline fn c2Parallel(arg_a: c2v, arg_b: c2v, arg_kTol: f32) c_int {
    var a = arg_a;
    var b = arg_b;
    var kTol = arg_kTol;
    var k: f32 = c2Len(a) / c2Len(b);
    b = c2Mulvs(b, k);
    if (((if ((a.x - b.x) < @intToFloat(f32, @as(c_int, 0))) -(a.x - b.x) else a.x - b.x) < kTol) and ((if ((a.y - b.y) < @intToFloat(f32, @as(c_int, 0))) -(a.y - b.y) else a.y - b.y) < kTol)) return 1;
    return 0;
}
pub inline fn c2Rot(arg_radians: f32) c2r {
    var radians = arg_radians;
    var r: c2r = undefined;
    c2SinCos(radians, &r.s, &r.c);
    return r;
}
pub inline fn c2RotIdentity() c2r {
    var r: c2r = undefined;
    r.c = 1.0;
    r.s = 0;
    return r;
}
pub inline fn c2RotX(arg_r: c2r) c2v {
    var r = arg_r;
    return c2V(r.c, r.s);
}
pub inline fn c2RotY(arg_r: c2r) c2v {
    var r = arg_r;
    return c2V(-r.s, r.c);
}
pub inline fn c2Mulrv(arg_a: c2r, arg_b: c2v) c2v {
    var a = arg_a;
    var b = arg_b;
    return c2V((a.c * b.x) - (a.s * b.y), (a.s * b.x) + (a.c * b.y));
}
pub inline fn c2MulrvT(arg_a: c2r, arg_b: c2v) c2v {
    var a = arg_a;
    var b = arg_b;
    return c2V((a.c * b.x) + (a.s * b.y), (-a.s * b.x) + (a.c * b.y));
}
pub inline fn c2Mulrr(arg_a: c2r, arg_b: c2r) c2r {
    var a = arg_a;
    var b = arg_b;
    var c: c2r = undefined;
    c.c = (a.c * b.c) - (a.s * b.s);
    c.s = (a.s * b.c) + (a.c * b.s);
    return c;
}
pub inline fn c2MulrrT(arg_a: c2r, arg_b: c2r) c2r {
    var a = arg_a;
    var b = arg_b;
    var c: c2r = undefined;
    c.c = (a.c * b.c) + (a.s * b.s);
    c.s = (a.c * b.s) - (a.s * b.c);
    return c;
}
pub inline fn c2Mulmv(arg_a: c2m, arg_b: c2v) c2v {
    var a = arg_a;
    var b = arg_b;
    var c: c2v = undefined;
    c.x = (a.x.x * b.x) + (a.y.x * b.y);
    c.y = (a.x.y * b.x) + (a.y.y * b.y);
    return c;
}
pub inline fn c2MulmvT(arg_a: c2m, arg_b: c2v) c2v {
    var a = arg_a;
    var b = arg_b;
    var c: c2v = undefined;
    c.x = (a.x.x * b.x) + (a.x.y * b.y);
    c.y = (a.y.x * b.x) + (a.y.y * b.y);
    return c;
}
pub inline fn c2Mulmm(arg_a: c2m, arg_b: c2m) c2m {
    var a = arg_a;
    var b = arg_b;
    var c: c2m = undefined;
    c.x = c2Mulmv(a, b.x);
    c.y = c2Mulmv(a, b.y);
    return c;
}
pub inline fn c2MulmmT(arg_a: c2m, arg_b: c2m) c2m {
    var a = arg_a;
    var b = arg_b;
    var c: c2m = undefined;
    c.x = c2MulmvT(a, b.x);
    c.y = c2MulmvT(a, b.y);
    return c;
}
pub inline fn c2xIdentity() c2x {
    var x: c2x = undefined;
    x.p = c2V(@intToFloat(f32, @as(c_int, 0)), @intToFloat(f32, @as(c_int, 0)));
    x.r = c2RotIdentity();
    return x;
}
pub inline fn c2Mulxv(arg_a: c2x, arg_b: c2v) c2v {
    var a = arg_a;
    var b = arg_b;
    return c2Add(c2Mulrv(a.r, b), a.p);
}
pub inline fn c2MulxvT(arg_a: c2x, arg_b: c2v) c2v {
    var a = arg_a;
    var b = arg_b;
    return c2MulrvT(a.r, c2Sub(b, a.p));
}
pub inline fn c2Mulxx(arg_a: c2x, arg_b: c2x) c2x {
    var a = arg_a;
    var b = arg_b;
    var c: c2x = undefined;
    c.r = c2Mulrr(a.r, b.r);
    c.p = c2Add(c2Mulrv(a.r, b.p), a.p);
    return c;
}
pub inline fn c2MulxxT(arg_a: c2x, arg_b: c2x) c2x {
    var a = arg_a;
    var b = arg_b;
    var c: c2x = undefined;
    c.r = c2MulrrT(a.r, b.r);
    c.p = c2MulrvT(a.r, c2Sub(b.p, a.p));
    return c;
}
pub inline fn c2Transform(arg_p: c2v, arg_radians: f32) c2x {
    var p = arg_p;
    var radians = arg_radians;
    var x: c2x = undefined;
    x.r = c2Rot(radians);
    x.p = p;
    return x;
}
pub inline fn c2Origin(arg_h: c2h) c2v {
    var h = arg_h;
    return c2Mulvs(h.n, h.d);
}
pub inline fn c2Dist(arg_h: c2h, arg_p: c2v) f32 {
    var h = arg_h;
    var p = arg_p;
    return c2Dot(h.n, p) - h.d;
}
pub inline fn c2Project(arg_h: c2h, arg_p: c2v) c2v {
    var h = arg_h;
    var p = arg_p;
    return c2Sub(p, c2Mulvs(h.n, c2Dist(h, p)));
}
pub inline fn c2Mulxh(arg_a: c2x, arg_b: c2h) c2h {
    var a = arg_a;
    var b = arg_b;
    var c: c2h = undefined;
    c.n = c2Mulrv(a.r, b.n);
    c.d = c2Dot(c2Mulxv(a, c2Origin(b)), c.n);
    return c;
}
pub inline fn c2MulxhT(arg_a: c2x, arg_b: c2h) c2h {
    var a = arg_a;
    var b = arg_b;
    var c: c2h = undefined;
    c.n = c2MulrvT(a.r, b.n);
    c.d = c2Dot(c2MulxvT(a, c2Origin(b)), c.n);
    return c;
}
pub inline fn c2Intersect(arg_a: c2v, arg_b: c2v, arg_da: f32, arg_db: f32) c2v {
    var a = arg_a;
    var b = arg_b;
    var da = arg_da;
    var db = arg_db;
    return c2Add(a, c2Mulvs(c2Sub(b, a), da / (da - db)));
}
pub inline fn c2BBVerts(arg_out: [*c]c2v, arg_bb: [*c]c2AABB) void {
    var out = arg_out;
    var bb = arg_bb;
    out[@intCast(c_uint, @as(c_int, 0))] = bb.*.min;
    out[@intCast(c_uint, @as(c_int, 1))] = c2V(bb.*.max.x, bb.*.min.y);
    out[@intCast(c_uint, @as(c_int, 2))] = bb.*.max;
    out[@intCast(c_uint, @as(c_int, 3))] = c2V(bb.*.min.x, bb.*.max.y);
}

pub inline fn c2Impact(ray: anytype, t: anytype) @TypeOf(c2Add(ray.p, c2Mulvs(ray.d, t))) {
    return c2Add(ray.p, c2Mulvs(ray.d, t));
}

pub inline fn c2Sin(radians: anytype) @TypeOf(@sin(radians)) {
    return @sin(radians);
}
pub inline fn c2Cos(radians: anytype) @TypeOf(@cos(radians)) {
    return @cos(radians);
}
pub inline fn c2Sqrt(a: anytype) @TypeOf(@sqrt(a)) {
    return @sqrt(a);
}
pub inline fn c2Min(a: anytype, b: anytype) @TypeOf(if (a < b) a else b) {
    return if (a < b) a else b;
}
pub inline fn c2Max(a: anytype, b: anytype) @TypeOf(if (a > b) a else b) {
    return if (a > b) a else b;
}
pub inline fn c2Abs(a: anytype) @TypeOf(if (a < @as(c_int, 0)) -a else a) {
    return if (a < @as(c_int, 0)) -a else a;
}
pub inline fn c2Clamp(a: anytype, lo: anytype, hi: anytype) @TypeOf(c2Max(lo, c2Min(a, hi))) {
    return c2Max(lo, c2Min(a, hi));
}
pub inline fn c2Sign(a: anytype) @TypeOf(if (a < @as(c_int, 0)) -@as(f32, 1.0) else @as(f32, 1.0)) {
    return if (a < @as(c_int, 0)) -@as(f32, 1.0) else @as(f32, 1.0);
}
