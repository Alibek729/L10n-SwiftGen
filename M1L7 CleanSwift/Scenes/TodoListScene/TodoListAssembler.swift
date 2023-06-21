//
//  TodoListAssembler.swift
//  M1L7 CleanSwift
//
//  Created by Alibek Kozhambekov on 15.06.2023.
//

import UIKit
import TaskManagePackage

final class TodoListAssembler {

	func assembly() -> UIViewController {

		let viewController = TodoListViewController()

		let taskManager = OrderedTaskManager(taskManager: TaskManager())
		let repository: ITaskRepository = TaskRepository()
		taskManager.addTasks(tasks: repository.getTasks())
		let sectionManagerAdapter = SectionForTaskManagerAdapter(taskManager: taskManager)

		let presenter = TodoListPresenter(viewController: viewController)
		let interactor = TodoListInteractor(sectionManager: sectionManagerAdapter, presenter: presenter)
		viewController.interactor = interactor

		return viewController
	}
}

