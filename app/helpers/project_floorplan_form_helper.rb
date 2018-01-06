module ProjectFloorplanFormHelper
  def setup_project(project)
    project.floorplans.build
    project
  end
end