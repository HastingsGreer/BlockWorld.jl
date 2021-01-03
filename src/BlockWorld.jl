module BlockWorld

export doit
using GLMakie, AbstractPlotting

function doit()
	scene = Scene(show_axis = false)

	# SSAO attributes are per scene
	scene[:SSAO][:radius][] = 5.0
	scene[:SSAO][:blur][] = 3
	scene[:SSAO][:bias][] = 0.025

	box = Rect3D(Point3f0(-0.5), Vec3f0(1))
	positions = [Point3f0(x, y, 10 * sin(x / 30) + rand()) for x in -450:450 for y in -450:450]
	meshscatter!(positions, marker=box, markersize=1, color=:lightblue, ssao=true)
    cam = cameracontrols(scene)
    display(scene)
    cam.near[] = .1
    print(cam.near[])
    cam 
end
end # module
