//
//  Agenda.swift
//  HealthLife
//
//  Created by Student10 on 22/09/23.
//



import SwiftUI


struct SheetView1: View{
    @Environment(\.dismiss) var dismiss
    @Binding var atual: TaskGDP
    @State private var data: String = ""
    @State private var titulo: String = ""
    @StateObject var viewModel = TaskModel()
    var body: some View {
        VStack
        {
            HStack {
                
                Text("Atualizar Tarefa")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .padding(.leading, 10.0)
                
                Spacer()
                Image("healthlogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.top, .bottom, .trailing], 20.0)
                    .padding(.leading, 70.0)
                    .frame(height: 100.0)
            }
            .frame(height: 80.0)
            .zIndex(1.0)
            .frame(
                maxWidth: .infinity,
                alignment: .topLeading
            )
            .background(Color("Topo"))
            
            Spacer()
            Text(" Modificar/Deletar")
                .bold()
                .font(.system(size: 30))
                                
            TextField("Titulo", text: $titulo)
                .multilineTextAlignment(.center)
                .foregroundColor(Color("themeT"))

                .frame(width: 200,height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color("themeT"), lineWidth: 1)
                )
                .padding()
                
                
                
                
                
            
            TextField("Data", text: $data)
                .multilineTextAlignment(.center)
                .frame(width: 200,height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color("themeT"), lineWidth: 1)
                )
                .padding(10.0)
            
            
            Button("Alterar"){
                if(titulo != "" && data != "" || (atual.titulo != titulo && atual.data != data))
                {
                    atual.titulo = titulo
                    atual.data = data
                    viewModel.Update(item: atual)
                }
               
                dismiss()

            }
            .frame(width: 150.0, height: 50.0)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("Topo")/*@END_MENU_TOKEN@*/)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color("Topo"), lineWidth: 4)
                
            )
            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
            .bold()
            
            Spacer()
                .frame(height: 15.0)
            Button("Deletar") {
                viewModel.remove(item: atual)
                dismiss()
            }
            .frame(width: 150.0, height: 50.0)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("Topo")/*@END_MENU_TOKEN@*/)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color("Topo"), lineWidth: 4)
                
            )
            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
            .bold()
            Spacer()
            Button("Cancelar") {
                dismiss()
            }
            .padding(.bottom, 20.0)
        }
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("themeB")/*@END_MENU_TOKEN@*/)
        
    }
    
    
    
}

struct SheetView2: View{
    @Environment(\.dismiss) var dismiss
    @State private var data: String = ""
    @State private var titulo: String = ""
    @StateObject var viewModel = TaskModel()
    var body: some View {
        VStack
        {

            HStack {
                
                Text("Criar Tarefa")
                    .font(.title)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.black)
                    .padding(.leading, 10.0)
                
                Spacer()
                Image("healthlogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding([.top, .bottom, .trailing], 20.0)
                    .padding(.leading, 70.0)
                    .frame(height: 100.0)
            }
            .frame(height: 80.0)
            .zIndex(1.0)
            .frame(
                maxWidth: .infinity,
                alignment: .topLeading
            )
            .background(Color("Topo"))
            
            Text("Adicionar Agendamento")
                .bold()
                .font(.system(size: 30))
                .padding(.top, 50)
                .padding(.bottom,50)
                
                
            TextField("Titulo", text: $titulo)
                .multilineTextAlignment(.center)
                
                .frame(width: 200,height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color("themeT"), lineWidth: 1)
                )
                .padding()
                
            
            TextField("Data", text: $data)
                .multilineTextAlignment(.center)
                .frame(width: 200,height: 40)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color("themeT"), lineWidth: 1)
                )
                .padding()
            Spacer()
                .frame(height: 20.0)
            Button("Criar"){
                viewModel.postItem(item: TaskP(data: data, titulo: titulo))
                dismiss()

            }
            .frame(width: 150.0, height: 50.0)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("Topo")/*@END_MENU_TOKEN@*/)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color("Topo"), lineWidth: 4)
                
            )
            .foregroundColor(Color.white)
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("Topo")/*@END_MENU_TOKEN@*/)
            .bold()
            
            Spacer()
            

        }
        .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("themeB")/*@END_MENU_TOKEN@*/)
            
            Button("Cancelar") {
                dismiss()
            }
            .padding(.bottom, 20.0)
        }
        
    }

struct Agenda: View {
    /* @StateObject var viewModel = ViewModel()*/
    @State private var showingSheet1 = false
    @State private var showingSheet2 = false
  
    @StateObject var viewModel = TaskModel()
    @State private var atual : TaskGDP = TaskGDP(_id: "", _rev:"" , titulo: "", data: "")
    var body: some View {
        NavigationStack{
            VStack {
                
                HStack {
                    
                    Text("Agenda")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(Color.black)
                        .padding(.leading, 10.0)
                        
                    
                    Spacer()
                    Image("healthlogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding([.top, .bottom, .trailing], 20.0)
                        .padding(.leading, 70.0)
                        .frame(height: 100.0)
                }
                .frame(height: 80.0)
                .zIndex(1.0)
                .frame(
                    maxWidth: .infinity,
                    alignment: .topLeading
                )
                .background(Color("Topo"))
                
                HStack{
                                    
                                    Button {
                                        showingSheet2.toggle()
                                            
                                    }label: {
                                        Image(systemName: "cross.circle.fill")
                                            .resizable()
                                            .foregroundColor(/*@START_MENU_TOKEN@*/Color("themeT")/*@END_MENU_TOKEN@*/)
                                            .frame(width: 25, height: 25)
                                            .imageScale(.large)
                                            
                                            
                                        
                                        Text("Novo Tópico")
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .foregroundColor(Color("themeT"))
                                        
                                    }
                                    .sheet(isPresented: $showingSheet2, onDismiss: {viewModel.fetch2()})
                                {
                                    SheetView2()
                                }
                                    
                                    
                                    Spacer()
                                }
                .padding(.leading, 20.0)
                .padding(.top, 10.0)

                ScrollView(showsIndicators: false){
                    VStack(spacing: 20){
                        
                        
                        ForEach(viewModel.tasks, id:\.self) { item in
                            HStack{
                                VStack(alignment: .leading){
                                    Text(item.titulo!)
                                        .font(.title2)
                                        .fontWeight(.medium)
                                        .foregroundColor(Color("themeT"))
                                    Text(item.data!)
                                        .foregroundColor(Color("themeT"))
                                        .multilineTextAlignment(.leading)
                                }
                                
                                Spacer()
                                
                                Button {
                                    showingSheet1.toggle()
                                    atual = item
                                }label: {
                                    Image(systemName: "ellipsis").foregroundColor(Color("themeT")).frame(width: 40.0, height: 50.0).font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                                    
                                }
                                .foregroundColor(Color(.black))
                                .sheet(isPresented: $showingSheet1, onDismiss: {viewModel.fetch2()})
                                {
                                    SheetView1(atual: $atual)
                                }
                               
                                
                            }
                            
                            .padding(.all)
                            .background(Color("themeTask"))
                            .cornerRadius(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
                            .shadow(radius: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        }
                        .padding(.top, 10.0)
                        .frame(width: 350.0, height: 68.0)
                        
                        
                    }
                    
                    
                    
                }
                
                .padding(.all)
                
                
                
                
                
                
            }
            .background(/*@START_MENU_TOKEN@*//*@PLACEHOLDER=View@*/Color("themeB")/*@END_MENU_TOKEN@*/)
        }
        .background(Color(red: 0.8705882352941177, green: 0.8705882352941177, blue: 0.8705882352941177))
        .onAppear(){
            
            viewModel.fetch2()
            
          Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
               viewModel.fetch2()
           }
        }
        
    }
    
    
}


struct Agenda_Previews: PreviewProvider {
    static var previews: some View {
        Agenda()
    }
}

