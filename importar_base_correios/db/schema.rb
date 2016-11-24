# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160913144944) do

  create_table "AspNetRoles", primary_key: "Id", force: :cascade do |t|
    t.string "Name",          limit: 256,                     null: false
    t.string "Discriminator", limit: 128,        default: "", null: false
    t.text   "Description",   limit: 2147483647
  end

  add_index "AspNetRoles", ["Name"], name: "RoleNameIndex", unique: true

  create_table "AspNetUserClaims", primary_key: "Id", force: :cascade do |t|
    t.text   "ClaimType",  limit: 2147483647
    t.text   "ClaimValue", limit: 2147483647
    t.string "UserId",     limit: 128,        null: false
  end

  add_index "AspNetUserClaims", ["UserId"], name: "IX_UserId"

  create_table "AspNetUserLogins", primary_key: "UserId", force: :cascade do |t|
    t.string "LoginProvider", limit: 128, null: false
    t.string "ProviderKey",   limit: 128, null: false
  end

  add_index "AspNetUserLogins", ["UserId"], name: "IX_UserId"

  create_table "AspNetUserRoles", primary_key: "UserId", force: :cascade do |t|
    t.string "RoleId",        limit: 128,              null: false
    t.string "Discriminator", limit: 128, default: "", null: false
  end

  add_index "AspNetUserRoles", ["RoleId"], name: "IX_RoleId"
  add_index "AspNetUserRoles", ["UserId"], name: "IX_UserId"

  create_table "AspNetUsers", primary_key: "Id", force: :cascade do |t|
    t.string   "UserName",             limit: 256,                        null: false
    t.text     "PasswordHash",         limit: 2147483647
    t.text     "SecurityStamp",        limit: 2147483647
    t.string   "Email",                limit: 256
    t.boolean  "EmailConfirmed",                          default: false, null: false
    t.text     "PhoneNumber",          limit: 2147483647
    t.boolean  "PhoneNumberConfirmed",                    default: false, null: false
    t.boolean  "TwoFactorEnabled",                        default: false, null: false
    t.datetime "LockoutEndDateUtc"
    t.boolean  "LockoutEnabled",                          default: false, null: false
    t.integer  "AccessFailedCount",    limit: 4,          default: 0,     null: false
    t.integer  "ClientId",             limit: 4
  end

  add_index "AspNetUsers", ["ClientId"], name: "IX_ClientId"
  add_index "AspNetUsers", ["UserName"], name: "UserNameIndex", unique: true

  create_table "BlackLists", primary_key: "Id", force: :cascade do |t|
    t.string  "CEP",                    limit: 9,               null: false
    t.string  "AddressNumber",          limit: 20
    t.integer "ReasonForNonDeliveryId", limit: 2,  default: 0,  null: false
    t.string  "Cpf",                    limit: 11, default: ""
    t.string  "Cnpj",                   limit: 14, default: ""
  end

  add_index "BlackLists", ["Cpf", "Cnpj", "CEP", "AddressNumber"], name: "IX_Cpf_Cnpj_CEP_AddressNumber", unique: true
  add_index "BlackLists", ["ReasonForNonDeliveryId"], name: "IX_ReasonForNonDeliveryId"

  create_table "ClientCampains", primary_key: "Id", force: :cascade do |t|
    t.integer  "ClientId",               limit: 4,                null: false
    t.integer  "FileModelId",            limit: 4,                null: false
    t.string   "ClientFilePath",         limit: 500,              null: false
    t.string   "ClientFileName",         limit: 50,               null: false
    t.datetime "ClientFileImportedAt",                            null: false
    t.integer  "Status",                 limit: 4,    default: 0, null: false
    t.integer  "UnitId",                 limit: 2
    t.integer  "CostCenterId",           limit: 2
    t.datetime "ClientFilePrintedAt"
    t.string   "OS",                     limit: 50
    t.string   "codigo_remessa_cliente", limit: 4000
  end

  add_index "ClientCampains", ["ClientId"], name: "IX_ClientId"
  add_index "ClientCampains", ["CostCenterId"], name: "IX_CostCenterId"
  add_index "ClientCampains", ["FileModelId"], name: "IX_FileModelId"
  add_index "ClientCampains", ["OS"], name: "IX_OS"
  add_index "ClientCampains", ["UnitId"], name: "IX_UnitId"

  create_table "ClientFileRecords", primary_key: "Id", force: :cascade do |t|
    t.integer "Sequential",                limit: 4,                                                   null: false
    t.integer "ClientCampainId",           limit: 4,                                                   null: false
    t.text    "CPF",                       limit: 2147483647
    t.text    "CNPJ",                      limit: 2147483647
    t.text    "Address",                   limit: 2147483647
    t.text    "AddressNumber",             limit: 2147483647
    t.text    "Neighborhood",              limit: 2147483647
    t.text    "City",                      limit: 2147483647
    t.text    "CEP",                       limit: 2147483647
    t.text    "CompletionAddress",         limit: 2147483647
    t.text    "DMAddress",                 limit: 2147483647
    t.text    "DMAddressNumber",           limit: 2147483647
    t.text    "DMNeighborhood",            limit: 2147483647
    t.text    "DMCity",                    limit: 2147483647
    t.text    "DMState",                   limit: 2147483647
    t.text    "DMCEP",                     limit: 2147483647
    t.text    "DMCompletionAddress",       limit: 2147483647
    t.text    "DMStatusAddress",           limit: 2147483647
    t.text    "DMEmail",                   limit: 2147483647
    t.text    "DMPersonalPhoneNumber",     limit: 2147483647
    t.text    "DMPersonalCellPhoneNumber", limit: 2147483647
    t.text    "DMCompanyPhoneNumber",      limit: 2147483647
    t.boolean "Sanitized",                                                             default: false, null: false
    t.string  "CIF",                       limit: 35
    t.decimal "Value",                                        precision: 18, scale: 2, default: 0.0,   null: false
    t.integer "DeliveryStatusId",          limit: 4,                                                   null: false
    t.boolean "CheckForPrintIfDubious",                                                default: false, null: false
    t.boolean "CheckForPrintIfBlackList",                                              default: false, null: false
    t.boolean "InBlackList",                                                           default: false, null: false
    t.integer "BlackListId",               limit: 4
    t.varchar "Name",                      limit: 500
    t.varchar "State",                     limit: 2
    t.boolean "cep_apto",                                                              default: false, null: false
    t.string  "celular",                   limit: 4000
    t.string  "email",                     limit: 4000
    t.boolean "celular_apto",                                                          default: false, null: false
    t.boolean "email_apto",                                                            default: false, null: false
    t.integer "motivo_nao_entrega_id",     limit: 2
  end

  add_index "ClientFileRecords", ["BlackListId"], name: "IX_BlackListId"
  add_index "ClientFileRecords", ["ClientCampainId"], name: "IX_ClientCampainId"
  add_index "ClientFileRecords", ["DeliveryStatusId"], name: "IX_DeliveryStatusId"
  add_index "ClientFileRecords", ["Name", "State", "DeliveryStatusId"], name: "index_record_name_state_status"
  add_index "ClientFileRecords", ["Name", "State"], name: "index_record_name_state"
  add_index "ClientFileRecords", ["Name"], name: "index_record_name"

  create_table "Clients", primary_key: "Id", force: :cascade do |t|
    t.string  "FullName",                   limit: 100,                 null: false
    t.string  "AdministrativeCorreiosCode", limit: 8,   default: ""
    t.bigint  "SequentialBatch",            limit: 8,   default: 0,     null: false
    t.string  "Cnpj",                       limit: 14,  default: "",    null: false
    t.boolean "Active",                                 default: false, null: false
  end

  create_table "CorreiosDev", primary_key: "Id", force: :cascade do |t|
    t.varchar "COD_BARRAS",       limit: 100
    t.varchar "MOTIVO_DEVOLUCAO", limit: 100
    t.varchar "DATA_GERACAO",     limit: 100
    t.varchar "HORA_GERACAO",     limit: 100
    t.varchar "NOME_ARQ",         limit: 100
    t.varchar "CNPJ_cliente",     limit: 100
  end

  create_table "CorreiosParameters", primary_key: "Id", force: :cascade do |t|
    t.text "FTP",          limit: 2147483647, null: false
    t.text "User",         limit: 2147483647, null: false
    t.text "Password",     limit: 2147483647, null: false
    t.text "CorreiosCode", limit: 2147483647, null: false
  end

  create_table "CostCenters", primary_key: "Id", force: :cascade do |t|
    t.integer "ClientId", limit: 4,          null: false
    t.text    "Name",     limit: 2147483647, null: false
    t.boolean "Active",                      null: false
  end

  add_index "CostCenters", ["ClientId"], name: "IX_ClientId"

  create_table "DeliveryStatus", primary_key: "Id", force: :cascade do |t|
    t.text    "Description", limit: 2147483647
    t.boolean "Printed",                        default: false, null: false
    t.boolean "Delivered",                      default: false, null: false
  end

  create_table "FileModels", primary_key: "Id", force: :cascade do |t|
    t.string  "Description",                            limit: 100,                        null: false
    t.integer "ClientId",                               limit: 4,                          null: false
    t.integer "CPFField_InitialPosition",               limit: 2
    t.integer "CPFField_Size",                          limit: 2
    t.integer "CNPJField_InitialPosition",              limit: 2
    t.integer "CNPJField_Size",                         limit: 2
    t.integer "NameField_InitialPosition",              limit: 2
    t.integer "NameField_Size",                         limit: 2
    t.integer "AddressField_InitialPosition",           limit: 2
    t.integer "AddressField_Size",                      limit: 2
    t.integer "AddressNumberField_InitialPosition",     limit: 2
    t.integer "AddressNumberField_Size",                limit: 2
    t.integer "CompletionAddressField_InitialPosition", limit: 2
    t.integer "CompletionAddressField_Size",            limit: 2
    t.integer "NeighborhoodField_InitialPosition",      limit: 2
    t.integer "NeighborhoodField_Size",                 limit: 2
    t.integer "CityField_InitialPosition",              limit: 2
    t.integer "CityField_Size",                         limit: 2
    t.integer "StateField_InitialPosition",             limit: 2
    t.integer "StateField_Size",                        limit: 2
    t.integer "CEPField_InitialPosition",               limit: 2
    t.integer "CEPField_Size",                          limit: 2
    t.integer "ValueField_InitialPosition",             limit: 2,          default: 631,   null: false
    t.integer "ValueField_Size",                        limit: 2,          default: 15,    null: false
    t.text    "CommandToPrint",                         limit: 2147483647, default: "",    null: false
    t.text    "CommandToHomologPrint",                  limit: 2147483647, default: "",    null: false
    t.text    "StartsWith",                             limit: 2147483647
    t.integer "Skip",                                   limit: 4,          default: 0,     null: false
    t.boolean "Active",                                                    default: false
    t.string  "CPFField_StartsWith",                    limit: 4000
    t.string  "CNPJField_StartsWith",                   limit: 4000
    t.string  "NameField_StartsWith",                   limit: 4000
    t.string  "AddressField_StartsWith",                limit: 4000
    t.string  "AddressNumberField_StartsWith",          limit: 4000
    t.string  "CompletionAddressField_StartsWith",      limit: 4000
    t.string  "NeighborhoodField_StartsWith",           limit: 4000
    t.string  "CityField_StartsWith",                   limit: 4000
    t.string  "StateField_StartsWith",                  limit: 4000
    t.string  "CEPField_StartsWith",                    limit: 4000
    t.string  "ValueField_StartsWith",                  limit: 4000
    t.boolean "campo_fixo",                                                default: false, null: false
  end

  add_index "FileModels", ["ClientId"], name: "IX_ClientId"

  create_table "LastReadFtpParameters", primary_key: "Id", force: :cascade do |t|
    t.datetime "LastDate", null: false
  end

  create_table "PDFFiles", primary_key: "Id", force: :cascade do |t|
    t.integer "CampainId",   limit: 4,          null: false
    t.text    "fileName",    limit: 2147483647, null: false
    t.text    "Description", limit: 2147483647, null: false
  end

  add_index "PDFFiles", ["CampainId"], name: "IX_CampainId"

  create_table "ReasonForNonDeliveries", primary_key: "Id", force: :cascade do |t|
    t.string "Description", limit: 30, null: false
  end

  create_table "TB_REMESSA_AUX", primary_key: "ID_REMESSA_AUX", force: :cascade do |t|
    t.integer  "ID_REMESSA",               limit: 4,                          null: false
    t.varchar  "LINHA_DE_COMANDO",         limit: 500
    t.text     "NOME_PDF_FINAL",           limit: 2147483647
    t.text     "NOME_PDF_HOMOLOGACAO",     limit: 2147483647
    t.integer  "STATUS",                   limit: 4,                          null: false
    t.text     "DIRETORIO_ARQUIVOS_FTP",   limit: 2147483647
    t.text     "NOME_CLIENTE",             limit: 2147483647
    t.datetime "PRAZO",                                                       null: false
    t.datetime "DT_CRIACAO",                                                  null: false
    t.text     "DIRETORIO_SERVIDOR_DADOS", limit: 2147483647
    t.boolean  "ProcessamentoInspire",                        default: false, null: false
  end

  create_table "Units", primary_key: "Id", force: :cascade do |t|
    t.integer "ClientId", limit: 4,          null: false
    t.text    "Name",     limit: 2147483647, null: false
    t.boolean "Active",                      null: false
  end

  add_index "Units", ["ClientId"], name: "IX_ClientId"

  create_table "__MigrationHistory", primary_key: "MigrationId", force: :cascade do |t|
    t.string "ContextKey",     limit: 300,        null: false
    t.binary "Model",          limit: 2147483647, null: false
    t.string "ProductVersion", limit: 32,         null: false
  end

  create_table "anexo_campanhas", force: :cascade do |t|
    t.integer "ClientCampain_id",    limit: 4
    t.string  "nome_arquivo",        limit: 4000
    t.string  "caminho_ftp",         limit: 4000
    t.string  "caminho_com_arquivo", limit: 4000
  end

  add_index "anexo_campanhas", ["ClientCampain_id"], name: "index_anexo_campanhas_on_ClientCampain_id"

  create_table "autorizar_producaos", force: :cascade do |t|
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
    t.boolean  "apto_postagem"
    t.boolean  "apto_sms"
    t.boolean  "apto_email"
    t.boolean  "blacklist_postagem"
    t.boolean  "blacklist_sms"
    t.boolean  "blacklist_email"
    t.boolean  "inapto_postagem"
    t.boolean  "inapto_sms"
    t.boolean  "inapto_email"
    t.integer  "Clientcampain_id",   limit: 4, null: false
  end

  add_index "autorizar_producaos", ["Clientcampain_id"], name: "index_autorizar_producaos_on_Clientcampain_id"

  create_table "campanha_impressa", primary_key: "Id", force: :cascade do |t|
    t.integer  "ClientId",             limit: 4
    t.varchar  "Description",          limit: 250
    t.varchar  "ClientFileName",       limit: 250
    t.datetime "ClientFilePrintedAt"
    t.datetime "ClientFileImportedAt"
    t.integer  "Impressos",            limit: 4
    t.integer  "Entregues",            limit: 4
  end

  create_table "cep_intervalos", id: false, force: :cascade do |t|
    t.integer "id",     limit: 4
    t.integer "inicio", limit: 4
    t.integer "fim",    limit: 4
    t.varchar "uf",     limit: 3
  end

  create_table "cep_intervalos_temp", id: false, force: :cascade do |t|
    t.float  "F1"
    t.string "UF",          limit: 255
    t.string "CEP INICIAL", limit: 255
    t.string "CEP FINAL",   limit: 255
  end

  create_table "correios_ceps", force: :cascade do |t|
    t.string  "cep",                    limit: 4000, null: false
    t.string  "uf",                     limit: 4000, null: false
    t.string  "logradouro",             limit: 4000, null: false
    t.string  "tipo_logradouro",        limit: 4000, null: false
    t.string  "logradouro_com_tipo",    limit: 4000, null: false
    t.integer "correios_localidade_id", limit: 4,    null: false
  end

  add_index "correios_ceps", ["correios_localidade_id"], name: "index_correios_ceps_on_correios_localidade_id"

  create_table "correios_localidades", force: :cascade do |t|
    t.string "uf",                  limit: 4000, null: false
    t.string "localidade",          limit: 4000, null: false
    t.string "localidade_resumida", limit: 4000, null: false
  end

  create_table "log", id: false, force: :cascade do |t|
    t.varchar "log1", limit: 100
    t.integer "log2", limit: 4
  end

  create_table "notificacao_campanha_internas", force: :cascade do |t|
    t.string  "email",                   limit: 4000,                 null: false
    t.boolean "importacao",                           default: false, null: false
    t.boolean "geracao_pdf_homologacao",              default: false, null: false
    t.boolean "homologacao_pdf",                      default: false, null: false
  end

  create_table "notificacao_campanhas", force: :cascade do |t|
    t.integer  "cliente_id",              limit: 4
    t.string   "lista_destinatarios",     limit: 4000
    t.boolean  "importacao"
    t.boolean  "geracao_pdf_homologacao"
    t.boolean  "homologacao_pdf"
    t.datetime "created_at",                           null: false
    t.datetime "updated_at",                           null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 4000, default: "",    null: false
    t.string   "encrypted_password",     limit: 4000, default: "",    null: false
    t.string   "reset_password_token",   limit: 4000
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,    default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 4000
    t.string   "last_sign_in_ip",        limit: 4000
    t.datetime "created_at",                                          null: false
    t.datetime "updated_at",                                          null: false
    t.string   "username",               limit: 4000
    t.boolean  "admin",                               default: false
    t.integer  "cliente_id",             limit: 4
    t.string   "foto",                   limit: 4000
    t.boolean  "operacional",                         default: false, null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["username"], name: "index_users_on_username", unique: true

  add_foreign_key "AspNetUserClaims", "AspNetUsers", column: "UserId", primary_key: "Id", name: "FK_dbo.AspNetUserClaims_dbo.AspNetUsers_UserId"
  add_foreign_key "AspNetUserClaims", "AspNetUsers", column: "UserId", primary_key: "Id", name: "FK_dbo.AspNetUserClaims_dbo.AspNetUsers_User_Id", on_delete: :cascade
  add_foreign_key "AspNetUserLogins", "AspNetUsers", column: "UserId", primary_key: "Id", name: "FK_dbo.AspNetUserLogins_dbo.AspNetUsers_UserId"
  add_foreign_key "AspNetUserRoles", "AspNetRoles", column: "RoleId", primary_key: "Id", name: "FK_dbo.AspNetUserRoles_dbo.AspNetRoles_RoleId"
  add_foreign_key "AspNetUserRoles", "AspNetUsers", column: "UserId", primary_key: "Id", name: "FK_dbo.AspNetUserRoles_dbo.AspNetUsers_UserId"
  add_foreign_key "AspNetUsers", "Clients", column: "ClientId", primary_key: "Id", name: "FK_dbo.AspNetUsers_dbo.Clients_ClientId"
  add_foreign_key "BlackLists", "ReasonForNonDeliveries", column: "ReasonForNonDeliveryId", primary_key: "Id", name: "FK_dbo.BlackLists_dbo.ReasonForNonDeliveries_ReasonForNonDeliveryId"
  add_foreign_key "ClientCampains", "Clients", column: "ClientId", primary_key: "Id", name: "FK_dbo.ClientCampains_dbo.Clients_ClientId"
  add_foreign_key "ClientCampains", "CostCenters", column: "CostCenterId", primary_key: "Id", name: "FK_dbo.ClientCampains_dbo.CostCenters_CostCenterId"
  add_foreign_key "ClientCampains", "FileModels", column: "FileModelId", primary_key: "Id", name: "FK_dbo.ClientCampains_dbo.FileModels_FileModelId"
  add_foreign_key "ClientCampains", "Units", column: "UnitId", primary_key: "Id", name: "FK_dbo.ClientCampains_dbo.Units_UnitId"
  add_foreign_key "ClientFileRecords", "BlackLists", column: "BlackListId", primary_key: "Id", name: "FK_dbo.ClientFileRecords_dbo.BlackLists_BlackListId"
  add_foreign_key "ClientFileRecords", "ClientCampains", column: "ClientCampainId", primary_key: "Id", name: "FK_dbo.ClientFileRecords_dbo.ClientCampains_ClientCampainId"
  add_foreign_key "ClientFileRecords", "DeliveryStatus", column: "DeliveryStatusId", primary_key: "Id", name: "FK_dbo.ClientFileRecords_dbo.DeliveryStatus_Status_Id"
  add_foreign_key "ClientFileRecords", "ReasonForNonDeliveries", column: "motivo_nao_entrega_id", primary_key: "Id"
  add_foreign_key "CostCenters", "Clients", column: "ClientId", primary_key: "Id", name: "FK_dbo.CostCenters_dbo.Clients_ClientId"
  add_foreign_key "FileModels", "Clients", column: "ClientId", primary_key: "Id", name: "FK_dbo.FileModels_dbo.Clients_ClientId"
  add_foreign_key "PDFFiles", "ClientCampains", column: "CampainId", primary_key: "Id", name: "FK_dbo.PDFFiles_dbo.ClientCampains_CampainId"
  add_foreign_key "Units", "Clients", column: "ClientId", primary_key: "Id", name: "FK_dbo.Units_dbo.Clients_ClientId"
  add_foreign_key "anexo_campanhas", "ClientCampains", primary_key: "Id"
  add_foreign_key "autorizar_producaos", "ClientCampains", column: "Clientcampain_id", primary_key: "Id"
  add_foreign_key "correios_ceps", "correios_localidades"
  add_foreign_key "notificacao_campanhas", "Clients", column: "cliente_id", primary_key: "Id"
  add_foreign_key "users", "Clients", column: "cliente_id", primary_key: "Id"
end
